# require './lib/enigma'

# class Shifter < Enigma
module Shifter

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

  # def todays_date
  #   Date.today.strftime('%d%m%y').to_i
  # end

  # def date_squared(date)
  #   date.to_i * date.to_i
  # end

  def date_last_four(date)
    date_squared(date).to_s[-4..-1].split(//).map do |num|
      num.to_i
    end
  end

  # def offset_a(key, date)
  #   date_last_four(date)[0].to_i
  # end
  #
  # def offset_b(key, date)
  #   date_last_four(date)[1].to_i
  # end
  #
  # def offset_c(key, date)
  #   date_last_four(date)[2].to_i
  # end
  #
  # def offset_d(key, date)
  #   date_last_four(date)[3].to_i
  # end

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
    @shifts = [final_shift_a(key, date), final_shift_b(key, date), final_shift_c(key, date), final_shift_d(key, date)]
    # @shifts
  end





end
