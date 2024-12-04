class User < ApplicationRecord
  has_many :user_groups
  has_many :groups, through: :user_groups
  has_many :owned_groups, class_name: "Group", foreign_key: :owner_id, inverse_of: :owner, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :choices
  has_one_attached :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def owner_groups
    Group.where(owner: self)
  end
end
