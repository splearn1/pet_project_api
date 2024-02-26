class Prescription < ApplicationRecord
  belongs_to :pet
  belongs_to :vet
  belongs_to :med

  validates :frequency, presence: true
  validates :duration, presence: true
  validates :date_prescribed, presence: true
end
