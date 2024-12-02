class Choice < ApplicationRecord
  belongs_to :poll
  belongs_to :user
  has_many :votes, dependent: :destroy
  validates :answer, presence: true
  validates :metadata, presence: true, allow_nil: true

  def photo
    metadata['photo']
  end
end
