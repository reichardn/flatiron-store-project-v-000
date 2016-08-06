class CartsController < ApplicationController

  before_action :set_cart!, except: [:create, :index, :new]

  def checkout
    @cart.checkout
    redirect_to cart_path(params[:id])
  end

  private 

  def set_cart!
    @cart = Cart.find(params[:id])
  end

end
