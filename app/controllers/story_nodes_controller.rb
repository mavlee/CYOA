class StoryNodesController < ApplicationController
  def edit
    @story_node = StoryNode.find(params[:id])
    render 'edit'
  end

  def update
    @story_node = StoryNode.find(params[:id])
    @story_node.title = params[:story_node][:title]
    @story_node.content = params[:story_node][:content]
    @story_node.save

    render 'show'
  end

  def new
    @story_node = StoryNode.new
    render 'new'
  end

  def create
    @story_node = StoryNode.new
    @story_node.title = params[:story_node][:title]
    @story_node.content = params[:story_node][:content]
    @story_node.save

    @story_branch = StoryBranch.new
    @story_branch.from_node_id = params[:story_node][:referer]
    @story_branch.to_node_id = @story_node.id
    @story_branch.save

    redirect_to :action => :show, :id => @story_node.id
  end

  def show
    # A lot of these can be redone
    # It's 4:30 AM and I can't think of smart schemas
    @story_node = StoryNode.find(params[:id])
    @story = Story.where(:start_node => @story_node.id)[0]

    render 'show'
  end
end
