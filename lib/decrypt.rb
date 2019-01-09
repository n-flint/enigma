require './lib/enigma'

message = File.open(ARGV[0], "r")
read_message = message.read
message.close

enigma = Enigma.new
decrypt = enigma.decrypt(read_message, ARGV[2], ARGV[3])
joined = "Created #{ARGV[1]} with the key 82648 and date 240818"
output = File.open(ARGV[1], "w")
output.write("#{decrypt[:decryption]}")
output.close
puts joined
