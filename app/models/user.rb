# t.string   "full_name"
# t.string   "email"
# t.string   "username"
# t.string   "pw"

class User < ActiveRecord::Base
  attr_accessor :password
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
  
  def matches_pw?(submitted_pw)
    
  end
  
  private
    def encrypt_pw
      self.encrypted_pw = encrypt(pw)
    end
    
    # temporay implementation
    def encrypt(string)
      string
    end
end

