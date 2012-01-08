class StoryController < ApplicationController
  def index
    @stories = Story.all

    respond_to do |format|
      format.html
      format.json { render :json => @stories }
    end
  end

  def create
    @storypath = Storypath.new(params[:storypath])

    respond_to do |format|
      if @storypath.title.nil?
        @storypaths = Story.all
        format.html
        format.json { render :json => @storypaths }
      elsif @storypath.save
        flash.now[:success] = "Story was successfully created."
        @storypaths = Story.all
        format.html
        format.json { render :json => @storypaths }
      else
        format.html { render action: "failure" }
      end
    end
  end

  def view
    @story = Story.find(params[:id]) #
  end

  def show
    @story = Story.find(params[:id])
    @storypath = Storypath.new # todo remove

    respond_to do |format|
      format.html
      format.json { render :json => @story }
    end
  end

  def update
    @story = Story.find(params[:id])
    if @story.update_attributes(params[:story])
      flash.now[:success] = "Content updated."
      redirect_to @story
      respond_to do |format|
        format.html { redirect_to @story }
        format.json { render :json => { :result => "ok" } }
      end
    else
      @title = "Edit user"

      respond_to do |format|
        format.html { render 'edit' }
        format.json { render :json => { :result => "ok" } }
      end
    end
  end

  def failure

  end
end
