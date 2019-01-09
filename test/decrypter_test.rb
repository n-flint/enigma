require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/decrypter'

class DecrypterTest < MiniTest::Test

  def test_it_can_rotate_a_letter_decrypt
    enigma = Enigma.new

    enigma.final_shifts("02715", "040895")

    assert_equal "h", enigma.rotate_letter_decrypt("k", "02715", "040895")
  end

  def test_it_decrypts_messages
    enigma = Enigma.new

    expected = "hello"
    assert_equal expected, enigma.decrypt_message("keder", "02715", "040895")
  end
end
