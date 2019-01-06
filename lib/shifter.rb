require 'date'
class Shifter
  attr_reader :date,
              :key

  def initialize(date = Date.today.strftime('%d%m%y'), key = ("02715"))
    @date = date
    @key = key
  end

  def date_squared
    @date.to_i * @date.to_i
  end

  def date_last_four
    date_squared.to_s[-4..-1]
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

  def key_a(key)
    key_a = (key[0] + key[1]).to_i
  end

  def key_b(key)
    key_b = (key[1] + key[2]).to_i
  end

  def key_c(key)
    key_c = (key[2] + key[3]).to_i
  end

  def key_d(key)
    key_d = (key[3] + key[4]).to_i
  end

  def final_shift_a
    offset_a + key_a(key)
  end

end
