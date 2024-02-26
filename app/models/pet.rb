class Pet < ApplicationRecord
  #associations
  belongs_to :user

  #validations
  validates :name, presence: true
  validates :species, presence: true
end
