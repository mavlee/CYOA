class FrontpageController < ApplicationController
  def frontpage
    @title = "Home"
    @user = User.new
    @sign_up = User.new
  end
end
