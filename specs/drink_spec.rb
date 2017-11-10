require('minitest/autorun')
require('minitest/rg')
require_relative('../drink.rb')

class TestDrink < MiniTest::Test

  def setup

    @drink = Drink.new("Beer", 5.00, 5)

  end

  def test_name
      assert_equal("Beer", @drink.name)
  end

  def test_price
      assert_equal(5.00, @drink.price)
  end

end
