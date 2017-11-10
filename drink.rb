class Drink

  attr_accessor :name, :price, :alcohol_level, :stock

  def initialize(name, price, alcohol_level, stock)
    @name = name
    @price = price
    @alcohol_level = alcohol_level
    @stock = stock
  end

end
