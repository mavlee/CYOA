class StoryNodesController < ApplicationController
  def edit
    @story_node = StoryNode.find(params[:id])
    render 'edit'
  end

  def update
    puts params
    puts params[:title]
    puts params[:content]
    @story_node = StoryNode.find(params[:id])
    @story_node.title = params[:story_node][:title]
    @story_node.content = params[:story_node][:content]
    @story_node.save

    render 'view'

  end

  def new

  end

  def show
    @story_node = StoryNode.find(params[:id])
    render 'view'
  end
end
