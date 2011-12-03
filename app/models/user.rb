# t.string   "full_name"
# t.string   "email"
# t.string   "username"
# t.string   "pw"

class User < ActiveRecord::Base
  attr_accessor :pw
  attr_accessible :full_name, 
                  :email, 
                  :username, 
                  :pw
  
  validates :full_name, 
    :presence => true,
    :length => { :maximum => 50 }
                        
  validates :email, 
    :presence => true,
    :format => { :with => /\A[\w+\-.]+@[a-z\d\-]+\.[a-z]+\z/i },
    :uniqueness => { :case_sensitive => false }
                    
  validates :username, 
    :presence => true
  
  validates :pw, 
    :presence => true, 
    :length => { :minimum => 6, :maximum => 40 }
                  
  before_save :encrypt_pw
  
  # returns true if the submitted pw matches the user's pw
  def matches_pw?(submitted_pw)
    encrypted_pw == encrypt(submitted_pw)
  end
  
  def self.authenticate?(email, submitted_pw)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.matches_pw?(submitted_pw)
  end
  
  private
    def encrypt_pw
      self.salt = make_salt unless matches_pw?(pw)
      self.encrypted_pw = encrypt(pw)
    end
    
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
    
    def make_salt
      secure_hash("#{Time.now.utc}--#{pw}")
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end

