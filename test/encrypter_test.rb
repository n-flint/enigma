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


end
