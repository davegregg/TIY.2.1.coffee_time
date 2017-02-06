require 'minitest/autorun'
#require 'pry'
require './human'
require './coffee'

class CaffeineTest < MiniTest::Test
  def test_humans_tend_to_be_sleepy
    tyler = Human.new "Tyler"
    assert tyler.alertness < 0.1
  end

  def test_humans_need_coffee
    randy = Human.new "Randy"
    refute randy.has_coffee?
    assert randy.needs_coffee?
  end

  def test_humans_can_drink_coffee
    sherri = Human.new "Sherri"
    tsmf = Coffee.new "Triple Shot Mocha Frappuccino"
    assert tsmf.full?

    sherri.buy tsmf
    sherri.drink!
    assert(sherri.alertness.between?(0.1, 0.33))
    refute tsmf.full?
    refute tsmf.empty?
  end

  def test_humans_can_drink_all_the_coffee
    trevor = Human.new "Trevor"
    tsmf = Coffee.new "Triple Shot Mocha Frappuccino"
    trevor.buy tsmf

    3.times { trevor.drink! }
    assert tsmf.empty?
    assert trevor.alertness > 0.9
  end

  class EspressoTest < CaffeineTest
    def setup
      @espresso = Coffee.new 'Espresso'
      @espresso.caffeination = 0.4
      @espresso.swigs = 1
      @graham = Human.new 'Graham'
      @graham.buy @espresso
    end

    def test_espresso_is_small?
      assert @espresso.swigs <= 1
    end

    def test_espresso_is_strong?
      assert @espresso.caffeination >= 0.35
    end

  end

end

class TeaTest < CaffeineTest
  def setup
    @darjeeling = Tea.new 'Darjeeling'
    @jeanine = Human.new 'Jeanine'
    @jeanine.buy @darjeeling
    @cups_drunk = 0
  end

  def jeanine_drinks
    @darjeeling.swigs.times { @jeanine.drink! }
    @cups_drunk += 1
  end

  def is_alert? (who)
    who.alertness >= 1
  end

  def test_is_jeanine_sleepy?
    refute is_alert? (@jeanine)
    until is_alert? (@jeanine)
      jeanine_drinks
      @jeanine.buy @darjeeling = Tea.new('Darjeeling')
    end
    assert is_alert? (@jeanine)
    assert @cups_drunk >= 2
  end

end

#binding.pry
