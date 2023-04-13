require_relative "./logic"

# debugging
record = Record.find(1)
record.initial_amount = 20
puts record.amount

# light weight assertion library
module EasyTest
  def self.assert(test)
    if test
      print '.'
    else
      print 'F'
    end
    sleep 0.1
  end
end

# arrange
record = Record.find(1)
record.initial_amount = 20

# act
result = record.amount

# assert
EasyTest.assert(result == 25)
EasyTest.assert(result != 25)

puts "\n\ntests finished"
