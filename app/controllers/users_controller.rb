class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    @title = @user.user_name
    
    respond_to do |format|
      if @user.save
        flash[:success] = "Welcome to BranchItOut!"
        format.html {render action: "user_home"}
      else
        format.html {render action: "failure"}
      end
    end
  end
end
