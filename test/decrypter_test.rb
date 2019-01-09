require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/decrypter'

class EncrypterTest < MiniTest::Test

  def test_it_exists
    decrypter = Decrypter.new

    assert_instance_of Decrypter, decrypter
  end




end
