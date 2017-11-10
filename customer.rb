require('pry')

class Customer

  attr_writer :name, :wallet, :age, :drunkeness
  attr_reader :name, :wallet, :age, :drunkeness

  def initialize(name, wallet, age, drunkeness)

    @name = name
    @wallet = wallet
    @age = age
    @drunkeness = drunkeness

  end

  def check_age()
    if age >= 18
      return true
    else
      return false
    end
  end

  def check_money(items, drink_name)
    for item in items
        if drink_name == item[:name] && wallet >= item[:price]
          return true
        else
          return false
        end
      end
  end

  def check_drunkeness()
    if @drunkeness <= 50
      return true
    else
      return false
    end
  end

  def check_stock(items, drink_name)
    for item in items
      if drink_name == item[:name] && item[:stock] >= 1
          item[:stock] -= 1
        return true
      end
    end
    return "Out of stock"
  end

  def remove_money(items, drink_name)
    for item in items
    if drink_name == item[:name] && @wallet >= item[:price]
      @wallet -= item[:price]
      return @wallet
    else
    end
      return "Customer doesn't have enough money"
    end
  end

  def buy_drink(pub, items, drink_name)
    for item in items
      if check_age() == true && check_money(items, drink_name) == true &&
        check_drunkeness() == true &&
        check_stock(items, drink_name) == true
        pub.till += item[:price]
        remove_money(items, drink_name)
        @drunkeness += item[:alcohol]
        return pub.till
      elsif check_age() == false
        return "Customer is too young"
      elsif check_drunkeness() == false
        return "Customer is too drunk"
      else
        return "Customer can't afford drink"
      end
    end
  end

  def customer_drunkenness(items, drink_name)
    for item in items
      if drink_name == item[:name]
        return @drunkeness += item[:alcohol]
      end
    end
  end

  def buy_food(pub, items, food_name)
    for item in items
      if food_name == item[:name] && check_money(items, food_name) == true && check_stock(items, food_name) == true
        pub.till += item[:price]
        remove_money(items, food_name)
          return @drunkeness -= item[:rejuv_level]
      end
    end
    return "Customer can't afford food"
  end

end
