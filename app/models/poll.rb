class Poll < ApplicationRecord
  belongs_to :group
  has_many :choices, dependent: :destroy
  enum category: {
    budget: 0,
    dates: 10,
    destination: 20,
    hebergement: 30
  }
  enum state: {
    nul: 0,
    en_cours: 10,
    fini: 20
  }
end
