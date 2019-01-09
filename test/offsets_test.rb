require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/offsets'

class OffsetsTest < MiniTest::Test

  def test_it_exists
    offsets = Offsets.new

    assert_instance_of Offsets, offsets
  end

  def test_it_can_find_todays_date
    offsets = Offsets.new

    assert_equal 90119, offsets.todays_date
  end

  def test_it_squares_the_date
    offsets = Offsets.new

    assert_equal 1672401025, offsets.date_squared("040895")
  end

  def test_it_can_find_last_four_of_date_squared
    offsets = Offsets.new

    assert_equal [1, 0, 2, 5], offsets.date_last_four("040895")
  end

  def test_it_can_generate_offsets
    offsets = Offsets.new

    assert_equal 1, offsets.offset_a("02715", "040895")
    assert_equal 0, offsets.offset_b("02715", "040895")
    assert_equal 2, offsets.offset_c("02715", "040895")
    assert_equal 5, offsets.offset_d("02715", "040895")
  end

end
