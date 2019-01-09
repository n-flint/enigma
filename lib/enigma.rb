require 'date'
require './lib/encrypter'
require './lib/decrypter'
require './lib/shifter'
require './lib/keys'
require './lib/offsets'

class Enigma
  include Encrypter,
          Decrypter,
          Shifter
  attr_reader :character_set,
              :shifts,
              :keys

  def initialize
    @character_set = ("a".."z").to_a << " "
    @shifts = []
    @keys = Keys.new
    @offsets = Offsets.new
  end

  def split_message(message, key, date)
    message.split(//)
  end

  def encrypt(message, key = pad_key, date = todays_date)
    final = Hash.new
    message = encrypt_message(message, key, date)
    final[:encryption] = message
    final[:key] = key
    final[:date] = date
    final
  end

  def decrypt(message, key = pad_key, date = todays_date)
    final = Hash.new
    message = decrypt_message(message, key, date)
    final[:decryption] = message
    final[:key] = key
    final[:date] = date
    final
  end
end
