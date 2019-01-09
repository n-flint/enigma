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

  def test_it_can_generate_offsets
    enigma = Enigma.new

    assert_equal 4, enigma.offset_a
    assert_equal 1, enigma.offset_b
    assert_equal 6, enigma.offset_c
    assert_equal 1, enigma.offset_d
  end

  #testing the value of the shifts?
  def test_it_can_find_final_shifts
    enigma = Enigma.new

    assert_equal 4, enigma.final_shifts.count
  end



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
  
end
