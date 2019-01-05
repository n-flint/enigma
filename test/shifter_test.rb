require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/shifter'
require './lib/enigma'

class ShifterTest < MiniTest::Test

  def test_it_exists
    shifter = Shifter.new

    assert_instance_of Shifter, shifter
  end

  def test_it_can_shift_keys
    shifter = Shifter.new
    expected = [02, 27, 71, 15]

    assert_equal expected, shifter.shift_keys(02715)
  end



end
