class Stock

  attr_accessor :items

  def initialize(stock)
    @items = items
  end


  def search_name(name, items)
    for item in items
      if name == item[:name]
        return item[:name]
      end
    end
  end


end
