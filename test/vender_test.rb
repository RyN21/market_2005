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

  def test_it_can_get_potential_revenue
    #items
    @peach = Item.new({name: 'Peach', price: "$0.75"})
    @tomato = Item.new({name: 'Tomato', price: '$0.50'})
    @peach_ras_nice_cream = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @banana_nice_cream = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    #vendors
    @rocky_mountain_fresh = Vendor.new("Rocky Mountain Fresh")
    @ba_nom_a_nom = Vendor.new("Ba-Nom-a-Nom")
    @palisade_peach_shack = Vendor.new("Palisade Peach Shack")
    #add stock to vendors
    @rocky_mountain_fresh.stock(@peach, 35)
    @rocky_mountain_fresh.stock(@tomato, 7)
    @ba_nom_a_nom.stock(@banana_nice_cream, 50)
    @ba_nom_a_nom.stock(@peach_ras_nice_cream, 25)
    @palisade_peach_shack.stock(@peach, 65)

    assert_equal 29.75, @rocky_mountain_fresh.potential_revenue
    assert_equal 345.00, @ba_nom_a_nom.potential_revenue
    assert_equal 48.75, @palisade_peach_shack.potential_revenue
  end
end
