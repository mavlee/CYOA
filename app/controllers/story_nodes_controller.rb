class StoryNodesController < ApplicationController
  def edit
    @story_node = StoryNode.find(params[:id])
    render 'edit'
  end

  def save

  end
end
