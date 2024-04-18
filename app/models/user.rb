class User < ApplicationRecord
    has_secure_password

    #associations
    has_many :pets

    #validations
    validates :username, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true

end
