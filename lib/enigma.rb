require 'date'

class Enigma


  def todays_date
    Date.today.strftime('%d%m%y')
  end

  def generate_key
    key = []
    5.times do
      key << rand(0..9)
    end
    key.join.to_i
  end


end
