class StoreController < ApplicationController
  skip_before_filter :authorize
  skip_before_filter :user_authorize
  def index
    @products = Product.all
    @cart = current_cart
   end
end
