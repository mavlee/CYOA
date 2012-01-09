class FrontpageController < ApplicationController
  def frontpage
    @title = "Home"
    @user = User.new

    respond_to do |format|
      @stories = Story.all
      format.html { render 'frontpage' }
    end
  end
end
