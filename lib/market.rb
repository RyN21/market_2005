class Market
  attr_reader :name,
              :vendor

  def initialize(name)
    @name   = name
    @vendor = []
  end

end
