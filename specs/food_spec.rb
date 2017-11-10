require('minitest/autorun')
require('minitest/rg')
require_relative('../food.rb')

class TestFood < MiniTest::Test

  def setup
    @food = Food.new("Crisps", 0.5, 10, 3)
  end

def test_food_name
  assert_equal("Crisps", @food.name)
end

end
