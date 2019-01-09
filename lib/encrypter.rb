require './lib/enigma'

class Encrypter < Enigma

  def encrypt_message(message, key, date)
    final_shifts(key, date)
    split_message(message, key, date).map do |letter|
      rotate_letter_encrypt(letter, key, date)
    end.join
  end



end
