class Med < ApplicationRecord
    #associations

    #validations
    validates :name, presence: true
    validates :dosage, presence: true
end
