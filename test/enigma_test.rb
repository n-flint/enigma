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
  #   assert_equal 5, enigma.generate_key.digits.count
  # end

  # def test_it_has_a_set_of_characters
  #   enigma = Enigma.new
  #   expected = ("a".."z").to_a << " "
  #
  #   assert_equal expected, enigma.character_set
  # end
end
