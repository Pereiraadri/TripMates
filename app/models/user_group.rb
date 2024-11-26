class UserGroup < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :user_id, uniqueness: { scope: :group_id, message: "est déjà membre de ce groupe" }

  # TODO: add roles
end
