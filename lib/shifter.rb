class Shifter

  def shift_key_a(key)
    key_a = (key[0] + key[1]).to_i
  end

  def shift_key_b(key)
    key_b = (key[1] + key[2]).to_i
  end

  def shift_key_c(key)
    key_c = (key[2] + key[3]).to_i
  end

  def shift_key_d(key)
    key_d = (key[3] + key[4]).to_i
  end
end
