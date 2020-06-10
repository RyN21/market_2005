require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/vendor'


class VendorTest < Minitest::Test
  def test_it_exists_and_has_attributes
    @vendor = Vendor.new("Rocky Mountain Fresh")

    assert_instance_of Vendor, @vendor
    assert_equal 'Rocky Mountain Fresh', @vendor.name
    assert_equal ({}), @vendor.inventory
  end

  def test_it_can_check_stock_and_inventory
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @peach = Item.new({name: 'Peach', price: "$0.75"})
    @tomato = Item.new({name: 'Tomato', price: '$0.50'})

    assert_equal 0, @vendor.check_stock(@peach)

    @vendor.stock(@peach, 30)
    assert_equal 30, @vendor.check_stock(@peach)

    @vendor.stock(@peach, 25)
    assert_equal 55, @vendor.check_stock(@peach)

    @vendor.stock(@tomato, 12)
    expected = ({@peach => 55, @tomato => 12})
    assert_equal expected, @vendor.inventory
  end

  def test_it_can_stock
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @peach = Item.new({name: 'Peach', price: "$0.75"})
    @tomato = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor.stock(@peach, 30)

    expected = ({@peach => 30})
    assert_equal expected, @vendor.inventory
  end
end
