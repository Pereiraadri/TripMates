class Group < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :user_groups
  has_many :polls
end
