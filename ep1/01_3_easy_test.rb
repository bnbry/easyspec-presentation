require_relative "./logic"

# debugging
record = Record.find(1)
record.initial_amount = 20
puts record.amount

# light weight assertion library
module EasyTest
  def self.assert(test)
    print test ? "\e[1m\e[32m.\e[0m" : "\e[1m\e[31mF\e[0m"
    sleep 0.1
  end

  def self.assert_equal(result, target)
    assert(result == target)
  end

  def self.assert_not_equal(result, target)
    assert(result != target)
  end
end

# arrange
record = Record.find(1)
record.initial_amount = 20

# act
result = record.amount

# assert
EasyTest.assert_equal(result, 25)
EasyTest.assert_not_equal(result, 25)

puts "\n\ntests finished"
