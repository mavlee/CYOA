class StoryNodesController < ApplicationController
  before_filter :authenticate, :only => [:new, :create]

  def edit
    @story_node = StoryNode.find(params[:id])
  end

  def update
    @story_node = StoryNode.find(params[:id])
    @story_node.title = params[:story_node][:title]
    @story_node.content = params[:story_node][:content]
    @story_node.save

    redirect_to @story_node
  end

  def new
    @story_node = StoryNode.new
  end

  def create
    @story_node = StoryNode.new
    @story_branch = StoryBranch.new
    @prev_story_node = StoryNode.find(params[:story_node][:parent])
    
    @story_node.title = params[:story_node][:title]
    @story_node.content = params[:story_node][:content]

    @story_node.story_id = @prev_story_node.story_id
    @story_node.author = current_user
    @story_node.save

    @story_branch.from_node_id = params[:story_node][:parent]
    @story_branch.to_node_id = @story_node.id
    @story_branch.save
    
    redirect_to @story_node
  end

  def show
    @story_node = StoryNode.find(params[:id])
    @story = Story.where(:start_node => @story_node.id).first
    @comment = Comment.new
    @comments = @story_node.comments.all
  end
end
