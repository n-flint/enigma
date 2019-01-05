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

  def test_it_can_get_todays_date
    enigma = Enigma.new

    current_date = Date.today.strftime('%d%m%y')
    assert_equal current_date, enigma.todays_date
  end



end
