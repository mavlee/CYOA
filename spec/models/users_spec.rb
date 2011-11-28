require 'spec_helper'

describe User do
  before(:each) do
    @user = { :full_name => "Example User", :email => "user@example.com", :username => "Example User", :pw => "Example" }
  end
    
  it "should create a new instance given valid attributes" do
    User.create!(@user)
  end
  
  # NAME RELATED **************************************************************************************************************************
  it "should require a name" do
    no_name_user = User.new(@user.merge(:full_name => ""))
    no_name_user.should_not be_valid
  end

  it "should reject names that are too long" do
    long_name_user = User.new(@user.merge(:full_name => "a" * 51))
    long_name_user.should_not be_valid
  end
    
  #email
  it "should require a email" do
    no_email_user = User.new(@user.merge(:email => ""))
    no_email_user.should_not be_valid
  end
  
  it "should accept valid email addresses" do 
    addresses = %w[a@foo.com a@fo.ca abcdefg@a.b abc_abc@abc.com first.last@foo.jp]
    
    addresses.each do |address|
      valid_email_user = User.new(@user.merge(:email => address))
      valid_email_user.should be_valid
    end
  end
  
  it "should reject invalid email addressess" do 
    addresses = %w[a a@ a@com a@.com a@.com.a @a @a. @a.com @.com.a a.com@ a.com.a@ timmy.a@foo.]
    
    addresses.each do |address|
      # puts address
      valid_email_user = User.new(@user.merge(:email => address))
      valid_email_user.should_not be_valid
    end
  end
  
  it "should reject duplicate email addresses" do
    # Put a user with given email address into the database
    User.create!(@user)
    user_with_duplicate_email = User.new(@user)
    user_with_duplicate_email.should_not be_valid
  end
  
  it "should reject email addresses identical up to case" do 
    upcased_email = @user[:email].upcase
    User.create!(@user.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@user)
    user_with_duplicate_email.should_not be_valid
  end

  # USERNAME RELATED **********************************************************************************************************************
  it "should require a username" do
    no_username_user = User.new(@user.merge(:username => ""))
    no_username_user.should_not be_valid
  end
  
  # PW RELATED **************************************************************************************************************************** 
  it "should require a pw" do
    no_pw_user = User.new(@user.merge(:pw => ""))
    no_pw_user.should_not be_valid
  end
  
  it "should reject short passwords" do
    short_pw_user = User.new(@user.merge(:pw => "a" * 5))
    short_pw_user.should_not be_valid
  end
  
  it "should reject long passwords" do
    long_pw_user = User.new(@user.merge(:pw => "a" * 41))
    long_pw_user.should_not be_valid
  end
  
  describe "password encryption" do
    it "should have an encrypted password attribute" do
      user= User.new(@user)
      user.should respond_to(:encrypted_pw)
    end
  end

end
