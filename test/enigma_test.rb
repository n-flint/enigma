require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EnigmaTest < MiniTest::Test

  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_it_has_a_set_of_characters
    enigma = Enigma.new
    expected = ("a".."z").to_a << " "

    assert_equal expected, enigma.character_set
  end

  def test_it_can_split_up_message
    enigma = Enigma.new

    expected = ["h", "e", "l", "l", "o"]
    assert_equal expected, enigma.split_message("hello", "02715", "040895")
  end

  def test_it_starts_with_empty_array
    enigma = Enigma.new

    assert_equal [], enigma.shifts
  end

  def test_it_correctly_encrypts_message
    enigma = Enigma.new
    expected = {
      :encryption => "keder ohulw",
      :key => "02715",
      :date => "040895"
    }
    actual = enigma.encrypt("hello world", "02715", "040895")

    assert_equal expected, actual
  end
  

  def test_it_can_rotate_a_letter_decrypt
    enigma = Enigma.new

    enigma.final_shifts("02715", "040895")

    assert_equal "h", enigma.rotate_letter_decrypt("k", "02715", "040895")
    assert_equal "!", enigma.rotate_letter_decrypt("!", "02715", "040895")
  end

  def test_it_correctly_decrypts_message
    enigma = Enigma.new
    expected = {
      :decryption => "hello world",
      :key => "02715",
      :date => "040895"
    }
    actual = enigma.decrypt("keder ohulw", "02715", "040895")

    assert_equal expected, actual
  end

  def test_it_can_generate_a_random_key
    keys = Keys.new
    actual = keys.generate_key.is_a? Integer

    assert_equal true, actual
  end

  def test_it_returns_five_digits_with_pad_key
    keys = Keys.new

    assert_equal 5, keys.pad_key.length
  end

  def test_it_can_find_todays_date
    offsets = Offsets.new

    assert_equal 90119, offsets.todays_date
  end
end
