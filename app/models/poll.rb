class Poll < ApplicationRecord
  belongs_to :group
  has_many :choices, dependent: :destroy
  has_many :votes, through: :choices

  def completed?
    votes.count >= group.members.count
  end

  enum category: {
    budget: 0,
    dates: 10,
    destination: 20,
    hebergement: 30
  }
  enum state: {
    nul: 0,
    en_cours: 10,
    fini: 20
  }

  def results
    total_votes = votes.count
    return {} if total_votes.zero?

    choices.each_with_object({}) do |choice, results|
      vote_count = choice.votes.count

      answer = self.budget? ? "#{choice.answer} €" : choice.answer

      results[answer] = (vote_count.to_f / total_votes * 100).round(2)
    end
  end

end
