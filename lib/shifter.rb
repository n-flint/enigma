module Shifter

  def final_shift_a(key, date)
    @offsets.offset_a(date) + @keys.combine_pairs(key)[0]
  end

  def final_shift_b(key, date)
    @offsets.offset_b(date) + @keys.combine_pairs(key)[1]
  end

  def final_shift_c(key, date)
    @offsets.offset_c(date) + @keys.combine_pairs(key)[2]
  end

  def final_shift_d(key, date)
    @offsets.offset_d(date) + @keys.combine_pairs(key)[3]
  end

  def final_shifts(key, date)
    @shifts = [final_shift_a(key, date), final_shift_b(key, date), final_shift_c(key, date), final_shift_d(key, date)]
  end
end
