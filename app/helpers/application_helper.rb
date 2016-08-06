module ApplicationHelper

  def current_cart
    if current_user
      current_user.current_cart
    end
  end

  def is_current_cart
    @cart == current_cart
  end
  
end
