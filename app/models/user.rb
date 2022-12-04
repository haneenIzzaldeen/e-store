class User < ApplicationRecord
    has_one :store
    validates :email , format: {with: URI::MailTo::EMAIL_REGEXP} ,presence: true , uniqueness: true
    # validates :password , length: { minimum: 6, maximum: 12 }
    validates :name , presence: true 
    enum :role , [:admin , :customer , :owner]
    def password
        @password
    end
    
    def password=(raw)
        @password = raw
        self.password_digest = BCrypt::Password.create(raw)
    end
    
    def is_password?(raw)
        BCrypt::Password.new(password_digest).is_password?(raw)
    end
 end
