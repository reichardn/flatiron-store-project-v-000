class Cart < ActiveRecord::Base

  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user 

  def total
    total = 0
    self.line_items.each do |li|
      total += li.quantity * li.item.price
    end
    total 
  end

  def print_total
    self.total.to_f / 100
  end

  def add_item(item_id)
    # Spec requires that the new LI not be saved (but I don't know why yet..)
    id = item_id.to_i
    self.line_items.each do |li|
      if li.item_id == id
        li.quantity += 1
        return li
      end
    end
    LineItem.new(cart_id: self.id, item_id: item_id)
  end

  def checkout
    self.line_items.each do |li|
      new_inventory = li.item.inventory - li.quantity 
      li.item.update(inventory: new_inventory)
    end
    self.status = 'submitted'
    self.user.current_cart = nil
  end

end
