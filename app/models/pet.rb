class Pet < ApplicationRecord
  #associations
  belongs_to :user
  has_many :prescriptions

  #validations
  validates :name, presence: true
  validates :species, presence: true
end
