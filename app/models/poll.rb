class Poll < ApplicationRecord
  belongs_to :group
  has_many :choices
end
