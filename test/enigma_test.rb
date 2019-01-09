require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

#enigma = Enigma.new maybe put in setup method?
class EnigmaTest < MiniTest::Test

  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_it_can_generate_a_random_key
    enigma = Enigma.new
    actual = enigma.generate_key.is_a? Integer

    assert_equal true, actual
  end

  def test_it_has_a_set_of_characters
    enigma = Enigma.new
    expected = ("a".."z").to_a << " "

    assert_equal expected, enigma.character_set
  end

  def test_it_can_make_random_key
    enigma = Enigma.new

    assert_instance_of Integer, enigma.generate_key
  end

  def test_it_generates_five_digits
    enigma = Enigma.new

    assert_equal 5, enigma.pad_key.length
  end

  def test_it_can_generate_key_pairs
    enigma = Enigma.new
    enigma.pad_key

    assert_equal 5, enigma.key_pairs.count
  end

  def test_it_can_combine_key_pairs
    enigma = Enigma.new
    enigma.key_pairs

    assert_equal 4, enigma.combine_pairs.count
  end

  def test_it_can_find_todays_date
    enigma = Enigma.new

    assert_equal 80119, enigma.todays_date
  end

  def test_it_squares_the_date
    enigma = Enigma.new

    assert_equal 6419054161, enigma.date_squared
  end

  def test_it_can_find_last_four_of_date_squared
    enigma = Enigma.new

    assert_equal [4, 1, 6, 1], enigma.date_last_four
  end

  # def test_it_can_generate_offsets
  #   enigma = Enigma.new
  #
  #
  # end



  # def test_it_can_get_final_shifts
  #   encrypter = Encrypter.new
  #
  #   assert_equal [3, 27, 73, 20], encrypter.shift_values
  # end

  # def test_it_can_get_final_shifts
  #   encrypter = Encrypter.new
  #
  #   assert_equal 6, encrypter.shifter.final_shift_a
  #   assert_equal 28, encrypter.shifter.final_shift_b
  #   assert_equal 77, encrypter.shifter.final_shift_c
  #   assert_equal 16, encrypter.shifter.final_shift_d
  # end

  # def test_it_correctly_encrypts_message
  #   #skip
  #   encrypter = Encrypter.new
  #   expected = {
  #     :encryption => "keder ohulw",
  #     :key => "02715",
  #     :date => "040895"
  #   }
  #   actual = encrypter.encrypt("hello world", "02715", "040895")
  #
  #   assert_equal expected, actual
  # end
  #
  # def test_it_exists
  #   shifter = Shifter.new
  #
  #   assert_instance_of Shifter, shifter
  # end
  #
  # def test_it_has_todays_date_as_default
  #   shifter = Shifter.new
  #   current_date = Date.today.strftime('%d%m%y')
  #
  #   assert_equal current_date, shifter.date
  # end
  #
  # #is it ok to have instance variables in a test like this?
  # def test_it_squares_the_date
  #   shifter = Shifter.new
  #
  #   assert_equal 4916674161, shifter.date_squared
  # end
  #
  # def test_it_can_find_last_four_of_date_squared
  #   shifter = Shifter.new
  #
  #   assert_equal "4161", shifter.date_last_four
  # end
  #
  # def test_it_can_generate_a_random_key
  #   shifter = Shifter.new
  #   actual = shifter.generate_key.is_a? Integer
  #
  #   assert_equal true, actual
  #   assert_equal 5, shifter.generate_key.digits.count
  # end
  #
  # def test_it_can_create_offsets
  #   shifter = Shifter.new
  #
  #   assert_equal 4, shifter.offset_a
  #   assert_equal 1, shifter.offset_b
  #   assert_equal 6, shifter.offset_c
  #   assert_equal 1, shifter.offset_d
  # end
  #
  # def test_it_can_create_keys
  #   shifter = Shifter.new
  #   #why does this not work with an integer as an argument
  #   assert_equal 02, shifter.key_a("02715")
  #   assert_equal 27, shifter.key_b("02715")
  #   assert_equal 71, shifter.key_c("02715")
  #   assert_equal 15, shifter.key_d("02715")
  # end
  #
  # def test_it_can_create_final_shifts
  #   shifter = Shifter.new
  #
  #   assert_equal 6, shifter.final_shift_a
  #   assert_equal 28, shifter.final_shift_b
  #   assert_equal 77, shifter.final_shift_c
  #   assert_equal 16, shifter.final_shift_d
  # end
  #
  # def test_it_can_get_array_of_final_shifts
  #   shifter = Shifter.new
  #
  #   assert_equal [6, 28, 77, 16], shifter.final_shifts
  # end
end
