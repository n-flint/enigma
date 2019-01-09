require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/encrypter'

class EncrypterTest < MiniTest::Test

  def test_it_can_rotate_a_letter_encrypt
    enigma = Enigma.new
    enigma.final_shifts("02715", "040895")

    assert_equal "k", enigma.rotate_letter_encrypt("h", "02715", "040895")
  end

  def test_it_encrypts_messages
    enigma = Enigma.new

    expected = "keder"
    assert_equal expected, enigma.encrypt_message("hello", "02715", "040895")
  end
end
