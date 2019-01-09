require './lib/enigma'

# class Encrypter < Enigma
module Encrypter

  def rotate_letter_encrypt(letter, key, date)
      final_index = @shifts[0] + @character_set.index(letter)
      @shifts.rotate!(1)
      letter = @character_set.rotate(final_index).first
  end

  def encrypt_message(message, key, date)
    final_shifts(key, date)
    split_message(message, key, date).map do |letter|
      rotate_letter_encrypt(letter, key, date)
    end.join
  end
end
