class UserGroup < ApplicationRecord
  belongs_to :user
  belongs_to :group

  # TODO: add roles
end
