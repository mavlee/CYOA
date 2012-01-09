class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end

  def create
    user = User.authenticate?(params[:sessions][:username])

    if user.nil?
      user = User.create(:username => params[:sessions][:username])
    end

    sign_in user

    redirect_to :controller => :frontpage, :action => :frontpage
  end

  def destroy
    sign_out
    redirect_to :controller => :frontpage, :action => :frontpage
  end
end
