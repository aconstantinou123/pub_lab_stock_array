require('minitest/autorun')
require('minitest/rg')
require_relative('../stock.rb')

class TestStock < Minitest::Test

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
			}
    ]

  @stock = Stock.new(@items)

  end



  def test_item_names
    assert_equal("Vodka", @stock.search_name("Vodka", @items))
  end

end
