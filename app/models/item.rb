class Item < ActiveRecord::Base

  belongs_to :category

  # has many line_items consolidated by line_item quantity
  has_many :line_items #, :order => 'quantity DESC'

  def self.available_items
    self.all.select {|i| i.inventory > 0}
  end

  def print_price
    self.price.to_f / 100
  end

end
