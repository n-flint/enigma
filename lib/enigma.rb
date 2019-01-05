require 'date'

class Enigma
  attr_reader :character_set

  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def todays_date
    Date.today.strftime('%d%m%y')
  end

  #this will also generate a key of 00000, is that ok?
  def generate_key
    key = []
    5.times do
      key << rand(0..9)
    end
    key.join.to_i
  end
end
