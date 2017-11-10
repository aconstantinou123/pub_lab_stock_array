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

  end



  def test_item_names
    assert_equal("Vodka", @stock.search_name("Vodka", @items))
  end

  def test_total_stock
    assert_equal(20, @stock.total_stock(@items))
  end

end
