require 'spec_helper'

describe "Users" do
  describe "signup" do
  
    describe "success" do
      it "should make a new user" do
        lambda do
          visit sign_up_path
          fill_in "user_full_name", :with => "Example User"
          fill_in "user_email",     :with => "user@example.com"
          fill_in "user_pw",        :with => "foobar"
          fill_in "user_username",  :with => "foobar"
          click_button
          response.should render_template(:home)
          response.should have_selector("div.flash.success", :content => "Welcome")
        end.should change(User, :count).by(1)
      end
    end
    
    describe "failure" do
      it "should not make a new user" do
        lambda do
          visit sign_up_path
          fill_in "user_full_name", :with => ""
          fill_in "user_email",     :with => ""
          fill_in "user_pw",        :with => ""
          fill_in "user_username",  :with => ""
          click_button
          response.should render_template(:sign_up)
          response.should have_selector("div#error_explanation")
        end.should_not change(User, :count)
      end
      
    end
  end
end
