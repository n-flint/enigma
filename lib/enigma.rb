require 'date'

class Enigma
  attr_reader :character_set

  def initialize
    @character_set = ("a".."z").to_a << " "
  end

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

  def key_pairs
    pad_key.split(//).map do |key|
      key.to_i
    end
  end

  def combine_pairs
    key_pairs.each_cons(2).to_a
  end

  def todays_date
    Date.today.strftime('%d%m%y').to_i
  end

  def date_squared
    todays_date * todays_date
  end

  def date_last_four
    date_squared.to_s[-4..-1].split(//).map do |num|
      num.to_i
    end
  end

  def offset_a
    date_last_four[0].to_i
  end

  def offset_b
    date_last_four[1].to_i
  end

  def offset_c
    date_last_four[2].to_i
  end

  def offset_d
    date_last_four[3].to_i
  end

  def final_shift_a
    offset_a + key_pairs[0]
  end

  def final_shift_b
    offset_b + key_pairs[1]
  end

  def final_shift_c
    offset_c + key_pairs[2]
  end

  def final_shift_d
    offset_d + key_pairs[3]
  end

  def final_shifts
    [final_shift_a, final_shift_b, final_shift_c, final_shift_d]
  end

end
