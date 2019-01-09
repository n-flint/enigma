require './lib/enigma'

class Shifter < Enigma

  def generate_key
    key = []
    5.times do
      key << rand(0..9)
    end
    key.join.to_i
  end



end
