class Order < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  has_many :products, :through => :line_items
  belongs_to :user

  PAYMENT_TYPES = [ "Check" , "Credit card" , "Purchase order" ]
  validates :name, :address, :email, :pay_type, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES

  #for kaminari
  #    default_scope -> { order('name')}

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def with_min_quantity?
    total = line_items.to_a.sum { |q| q.quantity }
    total <=5
  end

  def with_max_quantity?
    total = line_items.to_a.sum { |q| q.quantity }
    total > 5
  end
end
