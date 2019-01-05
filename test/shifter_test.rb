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

  def test_it_can_create_key_a
    shifter = Shifter.new
    #why does this not work with an integer as an argument
    assert_equal 02, shifter.shift_key_a("02715")
  end

  def test_it_can_create_key_b
    shifter = Shifter.new

    assert_equal 27, shifter.shift_key_b("02715")
  end



end
