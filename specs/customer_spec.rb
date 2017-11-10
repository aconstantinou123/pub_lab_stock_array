require('minitest/autorun')
require('minitest/rg')
require('pry')
require_relative('../pub.rb')
require_relative('../drink.rb')
require_relative('../customer.rb')
require_relative('../food.rb')
require_relative('../stock.rb')

class TestCustomer < MiniTest::Test

  def setup

    @items = [
			{
				name: "Vodka",
				price: 4.50,
        alcohol: 40,
        stock: 5
			},
			{
        name: "Beer",
				price: 5.00,
        alcohol: 10,
        stock: 5
			},
      {
        name: "Wine",
        price: 7.50,
        alcohol: 15,
        stock: 0
      },
      {
        name: "Crisps",
        price: 0.5,
        rejuv_level: 10,
        stock: 5
      },
      {
        name: "Steak",
        price: 20.00,
        rejuv_level: 30,
        stock: 5
      }

    ]

    @stock = Stock.new(@items)

    @pub = Pub.new("The King's Head", 0.0, [@drink1, @drink2, @drink3], [@food1, @food2, @food3])

    @customer = Customer.new("Alan", 20.00, 21, 0)
    @customer2 = Customer.new("Bob", 3.00, 15, 0)
    @customer3 = Customer.new("Chris", 20.00, 21, 40)
    @customer4 = Customer.new("Duncan", 20.00, 21, 60)


  end

  def test_customer_name
    assert_equal("Alan", @customer.name)
  end

  def test_customer_wallet
    assert_equal(20.00, @customer.wallet)
  end

  def test_customer_is_too_drunk__buy_drink
    assert_equal(4.50, @customer.buy_drink(@pub, @items, "Vodka"))
    assert_equal(9.00, @customer.buy_drink(@pub, @items, "Vodka"))
    assert_equal("Customer is too drunk", @customer.buy_drink(@pub, @items, "Vodka"))
  end

  def test_customer_is_too_young__buy_drink
    assert_equal("Customer is too young", @customer2.buy_drink(@pub, @items, "Vodka"))
  end

  def test_remove_money_from_wallet
    assert_equal(15.50, @customer.remove_money(@items, "Vodka"))
  end

  def test_customer_elligible__true
    assert_equal(true, @customer.check_age())
  end

  def test_customer_elligible__false
    assert_equal(false, @customer2.check_age())
  end

  def test_customer_has_enough_money
    assert_equal(true, @customer.check_money(@items,"Vodka"))
  end

  def test_drunkeness__drunk
    assert_equal(false, @customer4.check_drunkeness())
  end

  def test_drunkeness__sober
    assert_equal(true, @customer.check_drunkeness())
  end

  def test_buy_food_success
    @customer3.buy_food(@pub, @items, "Crisps")
    assert_equal(40, @customer3.drunkeness)
  end

  def test_customer_drunkenness
    @customer3.customer_drunkenness(@items, "Wine")
    assert_equal(55, @customer3.drunkeness)
  end

  def test_buy_food_fail
    @customer3.buy_food(@pub, @items, "Steak")
    assert_equal("Customer can't afford food", @customer3.buy_food(@pub, @items, "Steak"))
  end

  def test_check_stock_out_of_stock
    @customer.check_stock(@items, "Wine")
    assert_equal("Out of stock", @customer.check_stock(@items, "Wine"))
  end

  def test_check_stock_success
    @customer.check_stock(@items, "Vodka")
    assert_equal(true, @customer.check_stock(@items, "Vodka"))
  end
end
