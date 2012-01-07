class StoryController < ApplicationController
  def index
    @stories = Story.all
    
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @storypath = Storypath.new(params[:storypath])

    respond_to do |format|
      if @storypath.title.nil?
        @storypaths = Story.all
        format.html 
      elsif @storypath.save
        flash.now[:success] = "Story was successfully created."
        @storypaths = Story.all
        format.html 
        # redirect_to root_path
        # redirect_to :controller => "frontpage", :action => "frontpage"
        # format.html {render action: "frontpage/frontpage"}
      else
        format.html {render action: "failure"}
      end
    end
  end
  
  def view
    @story = Story.find(params[:id])
  end
  
  def show
    @story = Story.find(params[:id])
    @storypath = Storypath.new
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
