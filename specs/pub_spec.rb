require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../drink.rb')

class TestPub < MiniTest::Test

  def setup
    @drink1 = Drink.new("Vodka", 4.50, 40, 5)
    @drink2 = Drink.new("Beer", 5.00, 5, 3)
    @drink3 = Drink.new("Wine", 8.50, 25, 4)
    @pub = Pub.new("The King's Head", 0.0, [@drink1, @drink2, @drink3], [@food1, @food2, @food3])

  end

  def test_pub_name
    assert_equal("The King's Head", @pub.name)
  end

  def test_till_amount
    assert_equal(0, @pub.till)
  end

  def test_drinks_length
    assert_equal(3, @pub.drinks_length)
  end

end
