class FrontpageController < ApplicationController
  def frontpage
    @title = "Home"
    #@user = User.new
    #@sign_up = User.new
    @story = Story.new(params[:story])
    @story.start_node = StoryNode.new
    @storybranch = StoryBranch.new

    respond_to do |format|
      if @story.title.nil?
        @stories = Story.all
        format.html 
      elsif @story.save
        flash.now[:success] = "Story was successfully created."
        @stories = Story.all
        
        # storybranch(from, to)
        
        format.html 
        # redirect_to root_path
        # redirect_to :controller => "frontpage", :action => "frontpage"
        # format.html {render action: "frontpage/frontpage"}
      else
        format.html {render action: "failure"}
      end
    end
    
    #respond_to do |format|
    #  format.html 
    #end
  end
end
