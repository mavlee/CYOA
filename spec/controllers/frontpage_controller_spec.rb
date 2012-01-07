require 'spec_helper'

describe FrontpageController do
  render_views # render the views inside the controller tests so can test views as well

  describe "GET 'frontpage'" do
    it "should be successful" do
      get 'frontpage'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'frontpage'
      response.should have_selector("title", :content => "Twitter")
    end
  end
  
end
