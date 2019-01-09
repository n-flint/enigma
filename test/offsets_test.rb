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

    assert_equal 1, offsets.offset_a("040895")
    assert_equal 0, offsets.offset_b("040895")
    assert_equal 2, offsets.offset_c("040895")
    assert_equal 5, offsets.offset_d("040895")
  end

  def test_it_can_find_final_shifts
    enigma = Enigma.new

    expected = [3, 27, 73, 20]
    enigma.final_shifts("02715", "040895")

    assert_equal expected, enigma.shifts
  end

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

  def test_it_can_rotate_a_letter_decrypt
    enigma = Enigma.new

    enigma.final_shifts("02715", "040895")

    assert_equal "h", enigma.rotate_letter_decrypt("k", "02715", "040895")
    assert_equal "!", enigma.rotate_letter_decrypt("!", "02715", "040895")
  end

  def test_it_can_rotate_a_letter_encrypt
    enigma = Enigma.new
    enigma.final_shifts("02715", "040895")

    assert_equal "k", enigma.rotate_letter_encrypt("h", "02715", "040895")
    assert_equal "!", enigma.rotate_letter_encrypt("!", "02715", "040895")
  end
end
