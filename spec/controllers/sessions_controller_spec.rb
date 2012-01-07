require 'spec_helper'

describe SessionsController do
  render_views # render the views inside the controller tests so can test views as well

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'new'
      response.should have_selector("title", :content => "Sign in")
    end
  end
  
  describe "POST 'create" do
    describe "invalid singin" do
      
     before(:each) do
       @attr = { :email => "email@example.com",
                 :password => "invalid" }
     end
     
     it "should re-render the new page" do
       post :create, :session => @attr
       response.should render_template('new')
     end

     it "should have the right title" do
       post :create, :session => @attr
       response.should have_selector("title", :content => "Sign in")
     end

     it "should have a flash.now message" do
       post :create, :session => @attr
       flash.now[:error].should =~ /invalid/i
     end
     
    end
  end
  
end
