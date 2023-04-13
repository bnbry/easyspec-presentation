require_relative "./logic"

# debugging
record = Record.find(1)
record.initial_amount = 20
puts record.amount

# arrange
record = Record.find(1)
record.initial_amount = 20

# act
result = record.amount

# assert
puts result == 25
puts result != 25

puts "\n\ntests finished"
