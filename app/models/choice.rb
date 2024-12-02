class Choice < ApplicationRecord
  belongs_to :poll
  belongs_to :user
  has_many :votes, dependent: :destroy

  def percentage
    (votes.count.to_f / poll.votes.count * 100).round(2)
  end
end
