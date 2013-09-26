class SessionsController < ApplicationController
  skip_before_filter :authorize
  skip_before_filter :user_authorize

  def new
    if session[:user_id]
      redirect_to admin_url, :alert => "Already login."
    end
    render layout: false if request.xhr?
  end

  def create
    if user = User.authenticate(params[:name], params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, :alert => "Invalid user/password combination"
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to store_url, :notice => "Logged Out"
  end
end
