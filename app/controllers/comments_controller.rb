class CommentsController < ApplicationController
  before_filter :authenticate, :only => [:create]

  def create
    @story_node = StoryNode.find(params[:comment][:story_node_id]) 
    if @story_node.nil? 
      puts "Couldn't find storynode_id"
    end
    
    @comment = Comment.new
    @comment.title = params[:comment][:title]
    @comment.comment = params[:comment][:comment]
    @comment.user = current_user
    
    @story_node.comments << @comment
    
    @comments = Comment.all

    redirect_to @story_node
  end
end
