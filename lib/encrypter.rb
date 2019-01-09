module Encrypter

  def rotate_letter_encrypt(letter, key, date)
    if @character_set.include?(letter)
      final_index =  @character_set.index(letter) + @shifts[0]
      @shifts.rotate!(1)
      letter = @character_set.rotate(final_index).first
    else
      @shifts.rotate!(1)
      letter
    end
  end

  def encrypt_message(message, key, date)
    final_shifts(key, date)
    split_message(message, key, date).map do |letter|
      rotate_letter_encrypt(letter, key, date)
    end.join
  end
end
