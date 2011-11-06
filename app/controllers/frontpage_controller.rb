class FrontpageController < ApplicationController
  def frontpage
    @user = User.new
    @sign_up = User.new
  end
  
  def sign_up
    if @post.save
      format.html { redirect_to @post, notice: 'Post was successfully created.' }
    end
  end
end
