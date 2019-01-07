require './lib/shifter'
require './lib/enigma'


class Encrypter
  attr_reader :shifter,
              :character_set

  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def encrypt(message, key, date)
    @shifter = Shifter.new(date, key)
    # shift_values = @shifter.final_shifts
    # require "pry"
    # binding.pry
    letters = message.downcase.chars


  end


end
