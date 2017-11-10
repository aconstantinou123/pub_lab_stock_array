class Pub
  attr_accessor :name, :till, :drinks, :food

  def initialize(name, till, drinks, food)

    @name = name
    @till = till
    @drinks = drinks || []
    @food = food || []

  end

  def drinks_length
    return @drinks.length
  end

end
