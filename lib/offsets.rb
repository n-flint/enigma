
class Offsets

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


end
