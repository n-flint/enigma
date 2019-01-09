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

  # def test_it_can_generate_a_random_key
  #   enigma = Enigma.new
  #   actual = enigma.generate_key.is_a? Integer
  #
  #   assert_equal true, actual
  # end

  def test_it_has_a_set_of_characters
    enigma = Enigma.new
    expected = ("a".."z").to_a << " "

    assert_equal expected, enigma.character_set
  end

  # def test_it_can_make_random_key
  #   enigma = Enigma.new
  #
  #   assert_instance_of Integer, enigma.generate_key
  # end

  # def test_it_generates_five_digits
  #   enigma = Enigma.new
  #
  #   assert_equal 5, enigma.pad_key.length
  # end

  # def test_it_can_generate_key_pairs
  #   enigma = Enigma.new
  #   enigma.pad_key
  #
  #   assert_equal 5, enigma.key_pairs("02715").count
  # end

  # def test_it_can_combine_key_pairs
  #   enigma = Enigma.new
  #   enigma.key_pairs("02715")
  #
  #   assert_equal 4, enigma.combine_pairs("02715").count
  # end

  # def test_it_can_find_todays_date
  #   enigma = Enigma.new
  #
  #   assert_equal 90119, enigma.todays_date
  # end
  # 
  # def test_it_squares_the_date
  #   enigma = Enigma.new
  #
  #   assert_equal 1672401025, enigma.date_squared("040895")
  # end

  def test_it_can_find_last_four_of_date_squared
    enigma = Enigma.new

    assert_equal [1, 0, 2, 5], enigma.date_last_four("040895")
  end

  def test_it_can_generate_offsets
    enigma = Enigma.new

    assert_equal 1, enigma.offset_a("02715", "040895")
    assert_equal 0, enigma.offset_b("02715", "040895")
    assert_equal 2, enigma.offset_c("02715", "040895")
    assert_equal 5, enigma.offset_d("02715", "040895")
  end

  #testing the value of the shifts?
  def test_it_can_find_final_shifts
    enigma = Enigma.new
    expected = [3, 27, 73, 20]
    enigma.final_shifts("02715", "040895")

    assert_equal expected, enigma.shifts
  end

  # def test_it_can_rotate_a_letter_encrypt
  #   enigma = Enigma.new
  #   enigma.final_shifts("02715", "040895")
  #
  #   assert_equal "k", enigma.rotate_letter_encrypt("h", "02715", "040895")
  # end

  # def test_it_can_rotate_a_letter_decrypt
  #   enigma = Enigma.new
  #   enigma.final_shifts("02715", "040895")
  #
  #   assert_equal "h", enigma.rotate_letter_decrypt("k", "02715", "040895")
  # end

  def test_it_can_split_up_message
    enigma = Enigma.new

    expected = ["h", "e", "l", "l", "o"]
    assert_equal expected, enigma.split_message("hello", "02715", "040895")
  end

  def test_it_starts_with_empty_array
    enigma = Enigma.new

    assert_equal [], enigma.shifts
  end

  # def test_it_encrypts_messages
  #   enigma = Enigma.new
  #
  #   expected = "keder"
  #   assert_equal expected, enigma.encrypt_message("hello", "02715", "040895")
  # end

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


end
