require './lib/enigma'

class Shifter < Enigma

  def generate_key
    key = []
    5.times do
      key << rand(0..9)
    end
    key.join.to_i
  end

  def pad_key
    generate_key.to_s.rjust(5, "0")
  end

  def key_pairs(key)
    key.split(//).map do |key|
    key.to_i
    end
  end




end
