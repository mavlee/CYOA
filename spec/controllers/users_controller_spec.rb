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

  describe "POST 'create'" do
    describe "success" do
      
      before(:each) do 
        @attr = { :full_name => "New User",
                  :email => "user@example.com",
                  :pw => "foobar",
                  :username => "username" }
      end
      
      it "should create a user" do
        lambda do
          post :create, :user => @attr
        end.should change(User, :count).by(1)
      end
      
      it "should redirect to the user show page" do
        post :create, :user => @attr
        # response.should respond_to(user_create_path(assigns(:user)))
        response.should have_selector("title", :content => @attr["username"])
        # response.should render_template('home')
      end
      
      it "should have a welcome message" do
        post:create, :user => @attr
        # equals-tilde (=~) is the operator for comparing strings to regular expressions
        flash[:success].should =~ /welcome to the sample app/i  # the i means do a case-insensitive match
      end
    end
    
    describe "failure" do
      
      before(:each) do
        @attr = { :full_name => "",
                  :email => "",
                  :pw => "",
                  :username => "" }
      end
      
      it "should not create a user" do
        lambda do # lambda is a Ruby construct that checks that the block doesn't change the User count
          post :create, :user => @attr
        end.should_not change(User, :count) # change method returns the change in the number of user in the db
      end
      
      it "should render the 'new' page" do
        get :sign_up, :user => @attr
        response.should render_template('sign_up')
      end
    end
  end
end
