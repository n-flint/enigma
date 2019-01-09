require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/decrypter'

class DecrypterTest < MiniTest::Test

  def test_it_exists
    decrypter = Decrypter.new

    assert_instance_of Decrypter, decrypter
  end

  def test_it_can_rotate_a_letter_decrypt
    decrypter = Decrypter.new
    decrypter.final_shifts("02715", "040895")

    assert_equal "h", decrypter.rotate_letter_decrypt("k", "02715", "040895")
  end

  def test_it_decrypts_messages
    decrypter = Decrypter.new

    expected = "hello"
    assert_equal expected, decrypter.decrypt_message("keder", "02715", "040895")
  end



end
