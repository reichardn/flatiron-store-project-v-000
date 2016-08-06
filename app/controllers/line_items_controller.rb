class LineItemsController < ApplicationController

  def create
    current_user.current_cart = current_user.carts.create if !current_user.current_cart
    @cart = current_user.current_cart
    @list_item = @cart.add_item(params[:item_id])
    if @list_item.save
      redirect_to cart_path(@cart)
    end
  end

end
