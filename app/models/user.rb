class User < ApplicationRecord
    #validates the password
    before_validation :downcase_email

    def downcase_email
        email.try(:downcase!)
    end

    validates :username, presence: true, uniqueness: true
    #validates email
    validates :email, presence: true, uniqueness: true
    validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}

    #validates the password
    has_secure_password
    validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
    validates :password, confirmation: true
    validates :password_confirmation, confirmation: true

 
end
