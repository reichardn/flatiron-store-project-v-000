class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts

  def current_cart
    # NOTE: if later in the specs current cart is NOT the most recent, will need to add column to table
    if self.current_cart_id
      Cart.find(self.current_cart_id)
    else 
      nil
    end
  end

  def current_cart=(cart) 
    if cart.is_a?(Cart)
      self.current_cart_id = cart.id
    else
      self.current_cart_id = nil
    end

  end

end
