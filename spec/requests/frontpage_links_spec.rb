require 'spec_helper'

describe "FrontpageLinks" do
  describe "GET /frontpage_links" do
    it "GET homepage" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get '#root'
      response.status.should be(200)
    end
    
    it "GET sign_up" do
      get '/sign_up'
      response.should have_selector('title', :content => "Twitter | Sign Up")
    end
  end
end
