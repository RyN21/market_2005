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
    @palisade_peach_shack.stock(@peach_ras_nice_cream, 10)

    @market.add_vendor(@rocky_mountain_fresh)
    @market.add_vendor(@ba_nom_a_nom)
    @market.add_vendor(@palisade_peach_shack)
    
    assert_instance_of Market, @market
    assert_equal 'Peach', @peach.name
    assert_equal '$0.50', @tomato.price
  end
end



#
# pry(main)> market.total_inventory
# #=> {
  #   #<Item:0x007f9c56740d48...> => {
  #     quantity: 100,
  #     vendors: [#<Vendor:0x00007fe1348a1160...>, #<Vendor:0x00007fe134910650...>]
  #   },
  #   #<Item:0x007f9c565c0ce8...> => {
  #     quantity: 7,
  #     vendors: [#<Vendor:0x00007fe1348a1160...>]
  #   },
  #   #<Item:0x007f9c56343038...> => {
  #     quantity: 50,
  #     vendors: [#<Vendor:0x00007fe1349bed40...>]
  #   },
  #   #<Item:0x007f9c562a5f18...> => {
  #     quantity: 35,
  #     vendors: [#<Vendor:0x00007fe1349bed40...>, #<Vendor:0x00007fe134910650...>]
  #   },
  # }
#
# pry(main)> market.overstocked_items
# #=> [#<Item:0x007f9c56740d48...>]
#
# pry(main)> market.sorted_item_list
# #=> ["Banana Nice Cream", "Peach", "Peach-Raspberry Nice Cream", "Tomato"]
# ```
