class Choice < ApplicationRecord
  belongs_to :poll
  belongs_to :user
  has_many :votes, dependent: :destroy
end
