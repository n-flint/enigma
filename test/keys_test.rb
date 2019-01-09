require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/keys'

class KeysTest < MiniTest::Test

  def test_it_exists
    keys = Keys.new

    assert_instance_of Keys, keys
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
end
