require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EnigmaTest < MiniTest::Test

  def test_it_exists
    enigmam = Enigma.new

    assert_isntance_of Enigma, enigma
  end



end
