class Item
  attr_reade :name,
               :price

  def initialize(data)
    @name  = data[:name]
    @price = data[:price]
  end
end
