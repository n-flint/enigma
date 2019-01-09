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

  def test_it_correctly_decrypts_message
    #skip
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
