require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/shifter'

class ShifterTest < MiniTest::Test

  def test_it_exists
    shifter = Shifter.new

    assert_instance_of Shifter, shifter
  end

  def test_it_can_generate_a_random_key
    shifter = Shifter.new
    actual = shifter.generate_key.is_a? Integer

    assert_equal true, actual
  end

  def test_it_returns_five_digits_with_pad_key
    shifter = Shifter.new

    assert_equal 5, shifter.pad_key.length
  end

  def test_it_can_generate_key_pairs
    shifter = Shifter.new
    shifter.pad_key

    assert_equal 5, shifter.key_pairs("02715").count
  end



end
