class AdminController < ApplicationController
  skip_before_filter :user_authorize

  def index
    @user = current_user
    @total_orders = @user.orders.count
  end
end
