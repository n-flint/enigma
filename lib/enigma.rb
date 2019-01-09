require 'date'

class Enigma
  attr_reader :character_set,
              :shifts

  def initialize
    @character_set = ("a".."z").to_a << " "
    @shifts = []
  end

  # def generate_key
  #   key = []
  #   5.times do
  #     key << rand(0..9)
  #   end
  #   key.join.to_i
  # end

  # def pad_key
  #   generate_key.to_s.rjust(5, "0")
  # end

  # def key_pairs(key)
  #   key.split(//).map do |key|
  #   key.to_i
  #   end
  # end

  # def combine_pairs(key)
  #   pairs = key_pairs(key).each_cons(2).to_a
  #   pairs.map do |pair|
  #     pair.join.to_i
  #   end
  # end

  # def todays_date
  #   Date.today.strftime('%d%m%y').to_i
  # end

  # def date_squared(date)
  #   date.to_i * date.to_i
  # end

  # def date_last_four(date)
  #   date_squared(date).to_s[-4..-1].split(//).map do |num|
  #     num.to_i
  #   end
  # end

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
    @shifts = [final_shift_a(key, date), final_shift_b(key, date), final_shift_c(key, date), final_shift_d(key, date)]
    @shifts

  end

  # def rotate_letter_decrypt(letter, key, date)
  #   if @character_set.include?(letter)
  #     final_index =  @character_set.index(letter) - @shifts[0]
  #
  #     @shifts.rotate!(1)
  #     letter = @character_set.rotate(final_index).first
  #   else
  #     @shifts.rotate!(1)
  #     letter
  #   end
  # end

  # def rotate_letter_encrypt(letter, key, date)
  #
  #     final_index = @shifts[0] + @character_set.index(letter)
  #     @shifts.rotate!(1)
  #     letter = @character_set.rotate(final_index).first
  # end

  def split_message(message, key, date)
    message.split(//)
  end

  # def encrypt_message(message, key, date)
  #   final_shifts(key, date)
  #   split_message(message, key, date).map do |letter|
  #     rotate_letter_encrypt(letter, key, date)
  #   end.join
  # end

  # def decrypt_message(message, key, date)
  #   final_shifts(key, date)
  #   split_message(message, key, date).map do |letter|
  #     rotate_letter_decrypt(letter, key, date)
  #   end.join
  # end

  def encrypt(message, key = pad_key, date = todays_date)
    final = Hash.new
    message = encrypt_message(message, key, date)
    final[:encryption] = message
    final[:key] = key
    final[:date] = date
    final
  end

  def decrypt(message, key = pad_key, date = todays_date)
    final = Hash.new
    message = decrypt_message(message, key, date)
    final[:decryption] = message
    final[:key] = key
    final[:date] = date
    final
  end
end
