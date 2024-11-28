class Group < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :user_groups, dependent: :destroy
  has_many :users, through: :user_groups
  has_many :polls, dependent: :destroy
  has_one_attached :cover_banner

  before_create :generate_invite_token
  after_create :create_polls
  after_create :set_default_image

  def generate_invite_token
    self.invite_token = SecureRandom.hex(10)
  end

  def create_polls
    Poll.create(category: 0, group: self)
    Poll.create(category: 10, group: self)
    Poll.create(category: 20, group: self)
  end

  private

  def set_default_image
    if cover_banner.attached? == false
      default_image_path = Rails.root.join('app', 'assets', 'images', 'groupe_default_banner.jpg')
    end
  end
end
