class Drink
  attr_accessor :name, :price, :stock
  def initialize(name,price,stock)
    @name = name
    @price = price
    @stock = stock
  end

  def buyable?(money)
    self.stock > 0 && money >= self.price
  end
end