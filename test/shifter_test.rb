require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/shifter'
require './lib/enigma'

#Am I formating my code correctly according to the 4 phases of testing? Setup, execution, validation, clean up.
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

  def test_it_can_create_key_c
    shifter = Shifter.new

    assert_equal 71, shifter.shift_key_c("02715")
  end

  def test_it_can_create_key_d
    shifter = Shifter.new

    assert_equal 15, shifter.shift_key_d("02715")
  end

  def test_it_squares_the_date
    shifter = Shifter.new
    enigma = Enigma.new
    date = enigma.todays_date
    expected = date.to_i * date.to_i

    assert_equal expected, shifter.date_squared
  end


end
