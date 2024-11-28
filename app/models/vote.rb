class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :choice

  validates :user_id, uniqueness: { scope: :choice_id, message: "You can only vote once per choice" }
end
