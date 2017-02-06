class Human
  attr_accessor :name,
                :alertness,
                :beverage_in_hand

  def initialize(name, alertness=0)
    @name = name
    @alertness = alertness
  end

  def have? (this)
    this.to_s.to_i != 0
  end

  def has_coffee?
    have? (@beverage_in_hand)
  end

  def needs_coffee?
    !have? (@beverage_in_hand)
  end

  def buy(beverage)
    @beverage_in_hand = beverage
  end

  def drink!
    @beverage_in_hand.swigs -= 1
    @beverage_in_hand.kaff = '' if @beverage_in_hand.swigs <= 0
    @alertness += @beverage_in_hand.caffeination
  end
end
