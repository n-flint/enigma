require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/shifter'

class ShifterTest < MiniTest::Test

  def test_it_can_generate_key_pairs
    enigma = Enigma.new

    key_obj = enigma.keys
    key_obj.pad_key

    assert_equal 5, key_obj.key_pairs("02715").count
  end

  def test_it_can_combine_key_pairs
    enigma = Enigma.new

    key_obj = enigma.keys
    key_obj.key_pairs("02715")

    assert_equal 4, key_obj.combine_pairs("02715").count
  end

  def test_it_can_find_final_shifts
    enigma = Enigma.new

    expected = [3, 27, 73, 20]
    enigma.final_shifts("02715", "040895")

    assert_equal expected, enigma.shifts
  end

  def test_it_can_split_up_message
    enigma = Enigma.new

    expected = ["h", "e", "l", "l", "o"]
    assert_equal expected, enigma.split_message("hello", "02715", "040895")
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

  def test_it_can_rotate_a_letter_encrypt
    enigma = Enigma.new
    enigma.final_shifts("02715", "040895")

    assert_equal "k", enigma.rotate_letter_encrypt("h", "02715", "040895")
  end

  def test_it_can_find_todays_date
    offsets = Offsets.new

    assert_equal 90119, offsets.todays_date
  end

  def test_it_can_rotate_a_letter_decrypt
    enigma = Enigma.new

    enigma.final_shifts("02715", "040895")

    assert_equal "h", enigma.rotate_letter_decrypt("k", "02715", "040895")
    assert_equal "!", enigma.rotate_letter_decrypt("!", "02715", "040895")
  end
end
