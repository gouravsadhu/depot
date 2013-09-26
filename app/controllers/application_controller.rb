class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :authorize
  before_filter :user_authorize
  protect_from_forgery with: :exception

  private

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

  def current_user
    User.find(session[:user_id])
  end

  protected


  def authorize
    #   puts "test02"
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, :alert => "Please log in"
    end
  end

  def user_authorize
    unless current_user.admin?
      redirect_to admin_url, :alert => "You are not authorize to access."
    end
  end

end
