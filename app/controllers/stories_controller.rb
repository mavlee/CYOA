class StoriesController < ApplicationController
  def index
    @stories = Story.all
    
    respond_to do |format|
      format.html
    end
  end
  
  # POST /user
  def create    
    @story = Story.new(params[:story])

    respond_to do |format|
      if @story.save
        flash[:success] = "Welcome to the Sample App!"
        # redirect_to root_path
        # redirect_to :controller => "frontpage", :action => "frontpage"
        # format.html {render action: "frontpage/frontpage"}
      else
        format.html {render action: "failure"}
      end
    end
  end
  
  def show
    @story = Story.find(params[:id])
  end
  
  def failure
    
  end
end
