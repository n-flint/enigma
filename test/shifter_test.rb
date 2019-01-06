require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/shifter'
require './lib/enigma'

#Am I formating my code correctly according to the 4 phases of testing? Setup, execution, validation, clean up.

#maybe put shifter.new and todays date in the test helper?

class ShifterTest < MiniTest::Test

  def test_it_exists
    shifter = Shifter.new

    assert_instance_of Shifter, shifter
  end

  def test_it_has_todays_date_as_default
    shifter = Shifter.new
    current_date = Date.today.strftime('%d%m%y')

    assert_equal current_date, shifter.date
  end

  #is it ok to have instance variables in a test like this?
  def test_it_squares_the_date
    shifter = Shifter.new

    assert_equal 2511914161, shifter.date_squared
  end

  def test_it_can_find_last_four_of_date_squared
    shifter = Shifter.new

    assert_equal "4161", shifter.date_last_four
  end

  def test_it_can_create_offset_a
    shifter = Shifter.new

    assert_equal 4, shifter.offset_a
  end

  def test_it_can_create_offset_b
    shifter = Shifter.new

    assert_equal 1, shifter.offset_b
  end

  def test_it_can_create_offset_c
    shifter = Shifter.new

    assert_equal 6, shifter.offset_c
  end

  def test_it_can_create_offset_d
    shifter = Shifter.new

    assert_equal 1, shifter.offset_d
  end

  def test_it_can_create_key_a
    shifter = Shifter.new
    #why does this not work with an integer as an argument
    assert_equal 02, shifter.key_a("02715")
  end

  def test_it_can_create_key_b
    shifter = Shifter.new

    assert_equal 27, shifter.key_b("02715")
  end

  def test_it_can_create_key_c
    shifter = Shifter.new

    assert_equal 71, shifter.key_c("02715")
  end

  def test_it_can_create_key_d
    shifter = Shifter.new

    assert_equal 15, shifter.key_d("02715")
  end

  def test_it_can_create_final_shift_a
    shifter = Shifter.new

    assert_equal 6, shifter.final_shift_a
  end

end
