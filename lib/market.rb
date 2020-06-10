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
end
