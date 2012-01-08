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

    render 'view'
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
    @story_branch.from_node = params[:story_node][:referer]
    @story_branch.to_node = @story_node.id
    @story_branch.save

    render 'view'
  end

  def show
    @story_node = StoryNode.find(params[:id])
    @story_branches = StoryBranch.where(:from_node => @story_node.id)
    @branch_titles = StoryNode.all(:select => "title", :conditions => ["id in (?)", @story_branches.collect {|x| x.to_node }])

    render 'view'
  end
end
