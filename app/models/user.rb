class User < ApplicationRecord
    #validates the password
    has_secure_password
    validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
    validates :password, confirmation: true
    validates :password_confirmation, confirmation: true

 
end
