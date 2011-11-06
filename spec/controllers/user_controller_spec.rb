require 'spec_helper'

describe UserController do
  render_views # render the views inside the controller tests, so not just test the actions

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
