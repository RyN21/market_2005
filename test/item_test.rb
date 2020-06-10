require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/vendor'


class ItemTest < Minitest::Test
  def test_it_exists_and_has_attributes
    @peach = Item.new({name: 'Peach', price: "$0.75"})
    @tomato = Item.new({name: 'Tomato', price: '$0.50'})

    assert_instance_of Item, @peach
    assert_equal 'Peach', @peach.name
    assert_equal '$0.50', @tomato.price
  end
end
