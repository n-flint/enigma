require './lib/shifter'


class Encrypter
  attr_reader :shifter

  def initialize
    @shifter = Shifter.new
  end

  # def encrypt(message, key, date)
  #   shifts =
  #
  # end


end
