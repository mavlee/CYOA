class StoriesController < ApplicationController
  def index
    @stories = Story.all
    
    respond_to do |format|
      format.html
    end
  end
  
  def new
    @story = Story.new
    respond_to do |format|
      format.html
    end
  end
  
  def edit
    print 'ell'
  end
  
  def create
    @story = Story.new(params[:story])
    
    @storynode = StoryNode.new
    # @story.storynode = @storynode
    
    @story.save
    
    #@storynode = StoryNode.new
    #@story.startNode = @storynode.id

    #respond_to do |format|
    #  if @storypath.title.nil?
    #    @storypaths = Story.all
        # redirect_to @story
        
    #  elsif @storypath.save
    #    print "hello"
    #    flash.now[:success] = "Story was successfully created."
    #    @storypaths = Story.all
    #    render edit_story_path
        # redirect_to @story
        # redirect_to :controller => "frontpage", :action => "frontpage"
        # format.html {render action: "frontpage/frontpage"}
    #  else
    #    format.html {render action: "failure"}
    #  end
    #end
  end
  
  def view
    @story = Story.find(params[:id])
  end
  
  def show
    # @story = Story.find(params[:id])
   #  @storypath = Storypath.new
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
