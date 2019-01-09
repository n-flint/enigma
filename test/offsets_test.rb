require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/offsets'

class OffsetsTest < MiniTest::Test

  def test_it_exists
    offsets = Offsets.new

    assert_instance_of Offsets, offsets
  end

end
