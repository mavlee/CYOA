class UsersController < ApplicationController
  
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
    @user = User.find(params[:id])
  end
  
  def show_all
    @users = User.all
    
    respond_to do |format|
      format.html
    end
  end
  
  def dashboard
    @user = User.new(params[:user])
  end
  
  def user_home
    @user = User.new(params[:user])
    
    @user.save
  end  
  
end
