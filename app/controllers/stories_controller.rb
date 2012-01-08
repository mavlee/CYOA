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

    @story_node = StoryNode.new
    @story_node.save
    @story.start_node = @story_node.id

    @story.save
    @story_node.story_id = @story.id
    @story_node.save

    redirect_to :controller => 'story_nodes', :action => 'edit', :id => @story_node.id
  end

  def show
    @story = Story.find(params[:id])
    respond_to do |format|
      format.html {
        redirect_to :controller => 'story_nodes', :action => 'show',
                    :id => @story.start_node
      }
      format.json { render :json, @story }
    end
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
