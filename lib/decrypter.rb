require './lib/enigma'

class Decrypter < Enigma

  def rotate_letter_decrypt(letter, key, date)
    if @character_set.include?(letter)
      final_index =  @character_set.index(letter) - @shifts[0]

      @shifts.rotate!(1)
      letter = @character_set.rotate(final_index).first
    else
      @shifts.rotate!(1)
      letter
    end
  end


end
