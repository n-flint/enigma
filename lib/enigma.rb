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

  def offset_a(key, date)

    date_last_four(date)[0].to_i
  end

  def offset_b(key, date)
    date_last_four(date)[1].to_i
  end

  def offset_c(key, date)
    date_last_four(date)[2].to_i
  end

  def offset_d(key, date)
    date_last_four(date)[3].to_i
  end

  def final_shift_a(key, date)
    offset_a(key, date) + combine_pairs(key)[0]
  end

  def final_shift_b(key, date)
    offset_b(key, date) + combine_pairs(key)[1]
  end

  def final_shift_c(key, date)
    offset_c(key, date) + combine_pairs(key)[2]
  end

  def final_shift_d(key, date)
    offset_d(key, date) + combine_pairs(key)[3]
  end

  def final_shifts(key, date)
    [final_shift_a(key, date), final_shift_b(key, date), final_shift_c(key, date), final_shift_d(key, date)]
  end

  def rotate_shifts(key, date, count)
    @rotated_shift = final_shifts(key, date).rotate(count)
  end

  def rotate_letter(letter, key, date)
    counter = 0
    if counter < 4
      shifts = final_shifts(key, date)
      final_index = shifts[counter] + @character_set.index(letter)
      counter += 1
      letter = @character_set.rotate(final_index).first
      
      # shifts.rotate(1)
    else
      counter = 0
    end
    letter
  end

  def split_message(message, key, date)
    message.split(//)
  end

  def encrypt(message, key = pad_key, date = todays_date)
    split_message(message, key, date).map do |letter|

      rotate_letter(letter, key, date)
    end.join
  end



end
