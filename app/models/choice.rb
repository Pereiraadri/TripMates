class Choice < ApplicationRecord
  belongs_to :poll
  belongs_to :user
  has_many :votes, dependent: :destroy
  validates :answer, presence: true
  validates :metadata, presence: true, allow_nil: true

  def percentage
    (votes.count.to_f / poll.votes.count * 100).round(2)
  end

  def photo
    metadata['photo']
  end
end
