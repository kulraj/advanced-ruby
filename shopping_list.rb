=begin

Write a simple DSL for creating a shopping list. We should be able to specify the item name and quantity..

Something like.
sl = ShoppingList.new
sl.items do
  add("Toothpaste",2)
  add("Computer",1)

=end

class Item
  attr_reader :name, :quantity

  def initialize(name, quantity)
    @name = name
    @quantity = quantity
  end
end

class ShoppingList
  def initialize
    @list = []
  end
  def items(&block)
    instance_eval(&block)
  end
  def add(name, quantity)
    item = Item.new(name, quantity)
    @list << item
  end
  def show_items
    @list.each { |item| puts "Name: #{item.name}, Quantity = #{item.quantity}" }
  end
end

sl = ShoppingList.new
sl.items do
  add("Toothpaste",2)
  add("Computer",1)
end
sl.show_items
