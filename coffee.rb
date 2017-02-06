class Coffee
  attr_accessor :kaff, :swigs, :caffeination
  def initialize(kaff='Americano',swigs=3,caffeination=0.31)
    @kaff = kaff
    @swigs = swigs
    @caffeination = caffeination
  end

  def full?
    swigs >= 3
  end

  def empty?
    swigs <= 0
  end
end

class Tea < Coffee
  def initialize(kaff='English Breakfast',swigs=3,caffeination=0.25)
    @kaff = kaff
    @swigs = swigs
    @caffeination = caffeination
  end

end
