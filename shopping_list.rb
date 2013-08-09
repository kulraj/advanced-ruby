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
attr_reader :list
  def initialize
    @list = []
  end
  def add_item(item)
    @list << item
  end
end
    

sl = ShoppingList.new
toothpaste = Item.new("Toothpaste",2)
computer = Item.new("Computer",1)
sl.add_item(toothpaste)
sl.add_item(computer)
print sl.list
