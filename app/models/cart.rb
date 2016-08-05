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

  def add_item(item_id)
    # Spec requires that the new LI not be saved (but I don't know why yet..)
    self.line_items.each do |li|
      if li.item_id == item_id
        li.update(quantity: li.quantity + 1)
        return li
      end
    end
    LineItem.new(cart_id: self.id, item_id: item_id)
  end

end
