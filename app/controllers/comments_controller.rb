class CommentsController < ApplicationController
  def create
    @story_node = StoryNode.find(params[:comment][:story_node_id]) 
    if @story_node.nil? 
      puts "Couldn't find storynode_id"
    end
    
    @comment = Comment.new
    @comment.title = params[:comment][:title]
    @comment.comment = params[:comment][:comment]
    
    @story_node.comments << @comment
    
    @comments = Comment.all
  end
end
