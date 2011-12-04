require 'spec_helper'

describe UsersController do
  render_views # render the views inside the controller tests, so not just test the actions

  describe "GET 'show'" do
    before(:each) do
      @user = Factory(:user)
      # @attr = { :full_name => "Example User", :email => "user@example.com", :username => "Example User", :pw => "Example" }
      # @user = User.create!(@attr)
    end
    
    it "should be successful" do
      get :show, :id => @user.id
      response.should be_success
    end
    
    it "should find the right user" do
      get :show, :id => @user.id
      
      # the assigns method take in a symbol argument and returns the value of the corresponding instance variable in the controller action
      # or a.k.a. assigns(:user) returns the value of the instance variable @user in the show action of the Users controller
      assigns(:user).should == @user
    end
    
    it "should have the right title" do
      get :show, :id => @user.id
      
    end
  end

  describe "GET 'sign_up'" do
    it "should be successful" do
      get 'sign_up'
      response.should be_success
    end
  end
  
  describe "GET 'show_all'" do
    it "should be successful" do
      get 'show_all'
      response.should be_success
    end
  end

end
