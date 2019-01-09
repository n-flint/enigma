require './lib/enigma'

message = File.open(ARGV[0], "r")
read_message = message.read.chomp
message.close

enigma = Enigma.new
encrypt = enigma.encrypt(read_message)
joined = "Created #{ARGV[1]} with the key #{encrypt[:key]} and date #{encrypt[:date]}"
output = File.open(ARGV[1], "w")
output.write("#{encrypt[:encryption]}")
output.close
puts joined
