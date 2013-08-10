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
    @list = "hello"
  end
  def items(&block)
    
  end
end

def add(name, quantity)
print "add"
  item = Item.new(name, quantity)
  print list
end

sl = ShoppingList.new
sl.items do
  add("Toothpaste",2)
  add("Computer",1)
end
