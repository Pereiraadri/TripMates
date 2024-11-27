class Group < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :user_groups, dependent: :destroy
  has_many :users, through: :user_groups
  has_many :polls, dependent: :destroy
  has_one_attached :cover_banner

  before_create :generate_invite_token

def generate_invite_token
  self.invite_token = SecureRandom.hex(10)
end


end
