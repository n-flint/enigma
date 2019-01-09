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

  def test_it_can_combine_key_pairs
    shifter = Shifter.new
    shifter.key_pairs("02715")

    assert_equal 4, shifter.combine_pairs("02715").count
  end

  def test_it_can_find_todays_date
    shifter = Shifter.new

    assert_equal 90119, shifter.todays_date
  end


  def test_it_squares_the_date
    shifter = Shifter.new

    assert_equal 1672401025, shifter.date_squared("040895")
  end

  def test_it_can_find_last_four_of_date_squared
    shifter = Shifter.new

    assert_equal [1, 0, 2, 5], shifter.date_last_four("040895")
  end

  def test_it_can_generate_offsets
    shifter = Shifter.new

    assert_equal 1, shifter.offset_a("02715", "040895")
    assert_equal 0, shifter.offset_b("02715", "040895")
    assert_equal 2, shifter.offset_c("02715", "040895")
    assert_equal 5, shifter.offset_d("02715", "040895")
  end



end
