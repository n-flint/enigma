require './lib/shifter'
require './lib/enigma'


class Encrypter
  attr_reader :shifter

  def initialize
    @shifter = Shifter.new
  end

  def encrypt(message, key, date)
    letters = message.downcase.chars


  end


end
