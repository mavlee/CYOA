class StoriesController < ApplicationController
  def index
    @stories = Story.all
    
    respond_to do |format|
      format.html
    end
  end
  
  
  def show
    @story = Story.find(params[:id])
  end
  
  def update
    @story = Story.find(params[:id])
    if @story.update_attributes(params[:story])
      flash.now[:success] = "Content updated."
      redirect_to @story
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  
  def failure
    
  end
end
