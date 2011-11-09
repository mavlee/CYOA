class UserController < ApplicationController
  
  def sign_up
    @title = "Sign Up"
    
    @user = User.new(params[:user])
  end
  
  # POST /user
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html {render action: "show"}
      end
    end
  end
  
  def show
    @user = User.new(params[:user])
  end
  
  def show_all
    @users = User.all
    
    respond_to do |format|
      format.html
    end
  end
  
  def full_name
    
  end
end
