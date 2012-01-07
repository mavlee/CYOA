class FrontpageController < ApplicationController
  def frontpage
    @title = "Home"
    @user = User.new
    @sign_up = User.new
    @story = Story.new
    
    @story = Story.new(params[:story])

    respond_to do |format|
      if @story.save
        @stories = Story.all
        flash[:success] = "Welcome to the Sample App!"
        format.html 
        # redirect_to root_path
        # redirect_to :controller => "frontpage", :action => "frontpage"
        # format.html {render action: "frontpage/frontpage"}
      else
        format.html {render action: "failure"}
      end
    end
    
    #respond_to do |format|
    #  format.html 
    #end
  end
end
