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

  def combine_pairs(key)
    pairs = key_pairs(key).each_cons(2).to_a
    pairs.map do |pair|
      pair.join.to_i
    end
  end

  def todays_date
    Date.today.strftime('%d%m%y').to_i
  end

  def date_squared(date)
    date.to_i * date.to_i
  end

  def date_last_four(date)
    date_squared(date).to_s[-4..-1].split(//).map do |num|
      num.to_i
    end
  end





end
