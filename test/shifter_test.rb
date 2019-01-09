require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/shifter'

class ShifterTest < MiniTest::Test

  def test_it_can_generate_key_pairs
    # shifter = Shifter.new
    enigma = Enigma.new
    # require "pry"
    # binding.pry
    key_obj = enigma.keys
    key_obj.pad_key

    assert_equal 5, key_obj.key_pairs("02715").count
  end

  def test_it_can_combine_key_pairs
    skip
    # shifter = Shifter.new
    enigma = Enigma.new


    enigma.key_pairs("02715")

    assert_equal 4, enigma.combine_pairs("02715").count
  end

  def test_it_can_find_final_shifts
    skip
    shifter = Shifter.new
    expected = [3, 27, 73, 20]
    shifter.final_shifts("02715", "040895")

    assert_equal expected, shifter.shifts
  end
end
