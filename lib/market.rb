class Market
  attr_reader :name,
              :vendor

  def initialize(name)
    @name   = name
    @vendor = []
  end

  def add_vendor(vendor)
    @vendor << vendor
  end

  def vendor_names
    @vendor.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendor.find_all do |vendor|
      vendor.inventory.include?(item)
    end
  end
end
