require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/vendor'
require './lib/market'


class MarketTest < Minitest::Test
  def test_it_exists_and_has_attributes
    @market = Market.new("South Pearl Street Farmers Market")

    @peach = Item.new({name: 'Peach', price: "$0.75"})
    @tomato = Item.new({name: 'Tomato', price: '$0.50'})
    @peach_ras_nice_cream = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @banana_nice_cream = Item.new({name: "Banana Nice Cream", price: "$4.25"})

    @rocky_mountain_fresh = Vendor.new("Rocky Mountain Fresh")
    @ba_nom_a_nom = Vendor.new("Ba-Nom-a-Nom")
    @palisade_peach_shack = Vendor.new("Palisade Peach Shack")

    @rocky_mountain_fresh.stock(@peach, 35)
    @rocky_mountain_fresh.stock(@tomato, 7)
    @ba_nom_a_nom.stock(@banana_nice_cream, 50)
    @ba_nom_a_nom.stock(@peach_ras_nice_cream, 25)
    @palisade_peach_shack.stock(@peach, 65)

    # @market.add_vendor(@rocky_mountain_fresh)
    # @market.add_vendor(@ba_nom_a_nom)
    # @market.add_vendor(@palisade_peach_shack)

    assert_instance_of Market, @market
    # expected = [@rocky_mountain_fresh, @ba_nom_a_nom, @palisade_peach_shack]
    # assert_equal expected, @market.vendor
  end
end
