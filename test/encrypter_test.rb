require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/shifter'
require './lib/encrypter'

class EncrypterTest < MiniTest::Test

  def test_it_exists
    encrypter = Encrypter.new

    assert_instance_of Encrypter, encrypter
  end

  def test_it_can_get_final_shifts
    encrypter = Encrypter.new

    assert_equal 6, encrypter.shifter.final_shift_a
    assert_equal 28, encrypter.shifter.final_shift_b
    assert_equal 77, encrypter.shifter.final_shift_c
    assert_equal 16, encrypter.shifter.final_shift_d
  end

  def test_it_correctly_encrypts_message
    encrypter = Encrypter.new
    expected = {
      :encryption => "keder ohulw",
      :key => "02715",
      :date => "040895"
    }
    actual = encrypter.encrypt("hello world", "02715", "040895")

    assert_equal expected, actual
  end
end
