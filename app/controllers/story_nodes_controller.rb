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

    redirect_to :action => :show, :id => @story_node.id
  end

  def show
    # A lot of these can be redone
    # It's 4:30 AM and I can't think of smart schemas
    @story_node = StoryNode.find(params[:id])
    @story_branches = StoryBranch.where(:from_node => @story_node.id)
    @previous_node_branch = StoryBranch.where(:to_node => @story_node.id)[0]
    @story = Story.where(:start_node => @story_node.id)[0]
    @branch_titles = StoryNode.all(:select => "title", :conditions => ["id in (?)", @story_branches.collect {|x| x.to_node }])

    render 'view'
  end
end
