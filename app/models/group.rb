class Group < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :user_groups, dependent: :destroy
  has_many :polls, dependent: :destroy
end
