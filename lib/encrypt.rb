require './lib/enigma'

message = File.open(ARGV[0], "r")
read_message = message.read.chomp
message.close

enigma = Enigma.new
encrypt = enigma.encrypt(read_message, "02715", "040895")
joined = "Created #{ARGV[1]} with the key 82648 and date 240818"
output = File.open(ARGV[1], "w")
output.write("#{encrypt[:encryption]}")
output.close
puts joined
