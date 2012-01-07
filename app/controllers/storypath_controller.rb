class StorypathController < ApplicationController
  def show
    
  end
  
  def new
    
  end
  
  def create
    @storypath = Storypath.new(params[:storypath])

    respond_to do |format|
      if @storypath.title.nil?
        @storypaths = Story.all
        format.html 
      elsif @storypath.save
        flash.now[:success] = "Story was successfully created."
        @storypaths = Story.all
        format.html 
        # redirect_to root_path
        # redirect_to :controller => "frontpage", :action => "frontpage"
        # format.html {render action: "frontpage/frontpage"}
      else
        format.html {render action: "failure"}
      end
    end
  end
end
