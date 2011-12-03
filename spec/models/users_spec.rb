require 'spec_helper'

describe User do
  before(:each) do
    @attr = { :full_name => "Example User", :email => "user@example.com", :username => "Example User", :pw => "Example" }
  end
    
  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end
  
  # NAME RELATED **************************************************************************************************************************
  it "should require a name" do
    no_name_user = User.new(@attr.merge(:full_name => ""))
    no_name_user.should_not be_valid
  end

  it "should reject names that are too long" do
    long_name_user = User.new(@attr.merge(:full_name => "a" * 51))
    long_name_user.should_not be_valid
  end
    
  # EMAIL RELATED *************************************************************************************************************************
  it "should require a email" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end
  
  it "should accept valid email addresses" do 
    addresses = %w[a@foo.com a@fo.ca abcdefg@a.b abc_abc@abc.com first.last@foo.jp]
    
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end
  
  it "should reject invalid email addressess" do 
    addresses = %w[a a@ a@com a@.com a@.com.a @a @a. @a.com @.com.a a.com@ a.com.a@ timmy.a@foo.]
    
    addresses.each do |address|
      # puts address
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should_not be_valid
    end
  end
  
  it "should reject duplicate email addresses" do
    # Put a user with given email address into the database
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
  
  it "should reject email addresses identical up to case" do 
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  # USERNAME RELATED **********************************************************************************************************************
  it "should require a username" do
    no_username_user = User.new(@attr.merge(:username => ""))
    no_username_user.should_not be_valid
  end
  
  # PW RELATED **************************************************************************************************************************** 
  it "should require a pw" do
    no_pw_user = User.new(@attr.merge(:pw => ""))
    no_pw_user.should_not be_valid
  end
  
  it "should reject short passwords" do
    short_pw_user = User.new(@attr.merge(:pw => "a" * 5))
    short_pw_user.should_not be_valid
  end
  
  it "should reject long passwords" do
    long_pw_user = User.new(@attr.merge(:pw => "a" * 41))
    long_pw_user.should_not be_valid
  end
  
  describe "password encryption" do
    before(:each) do
      @user = User.create!(@attr)
    end
    
    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_pw)
    end
    
    it "should set the encrypted password" do
      @user.encrypted_pw.should_not be_blank
    end
    
    describe "matches_pw? method" do   
      it "should be true if the pws match" do
        @user.matches_pw?(@attr[:pw]).should be_true
      end
      
      it "should be false if the pws don't match" do
        @user.matches_pw?("invalid").should be_false
      end
    end
    
    describe "authenticate method" do   
      it "should return nil if email/pw combination invalid" do
        User.authenticate?(@attr[:email], "invalid").should be_nil
      end
      
      it "should return nil when no user exists with given address" do
        User.authenticate?("invalid", @attr[:pw]).should be_nil
      end
      
      it "should return the user object upon success" do
        User.authenticate?(@attr[:email], @attr[:pw]).should == @user
      end
    end
  end
end
