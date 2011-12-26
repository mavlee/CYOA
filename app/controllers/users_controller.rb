class UsersController < ApplicationController
  
  def sign_up
    @title = "Sign Up"
    
    @user = User.new(params[:user])
  end
  
  # POST /user
  def create    
    @user = User.new(params[:user])
    @title = @user.username

    respond_to do |format|
      if @user.save
        flash[:success] = "Welcome to the Sample App!"
        format.html {render action: "home"}
      else
        format.html {render action: "sign_up"}
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
  
  def home
    @user = User.new(params[:user])
  end  
  
end
