class Vet < ApplicationRecord

    #validations
    validates :name, presence: true
    validates :email, presence: true
    validates :phone, presence: true
end
