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

  def total_stock(items)
    total = 0
    for item in items
      total += item[:stock]
    end
    return total
  end


end
