class User < ActiveRecord::Base
    attr_accessor :remember_token
    before_save {self.email = email.downcase}
    validates :name, presence: true, length: {maximum: 50}
    validates :email, presence: true, length: {maximum: 50}, uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, length: {minimum: 3}

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
    
    # This creates one token per user.
    def User.new_token
        SecureRandom.urlsafe_base64
    end 

    def remember        
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end
    
    # remember digest is set when remember is called.
    # model is able to access its attributes by just using the variable name
    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
    
    def forget
        update_attribute(:remember_digest, nil)
    end
    


end
