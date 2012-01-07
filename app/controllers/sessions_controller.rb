class SessionsController < ApplicationController
  def new
    @title = "Sign in"
    
    redirect_to :controller => 'frontpage', :action => 'frontpage'
  end

  def create # POST to sessions_path
    user = User.authenticate?(params[:session][:email], params[:session][:pw])
    
    if user.nil?
        # Create an error message and re-render the signin form.
        flash[:error] = "Invalid email/password combination"
        # format.html {render :controller => 'frontpage', action: "frontpage"}
        redirect_to :controller => 'frontpage', :action => 'frontpage'
    else
        # Sign the user in and redirect to the user's show page.
        sign_in user
        redirect_to user
    end
  end
  
  def destroy
  end
end
