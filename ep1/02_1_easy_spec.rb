require_relative "./logic"

# light weight specification library
module EasySpec
  class ExpectationTarget
    def initialize(actual)
      @actual = actual
    end

    def assert(test)
      print test ? "\e[1m\e[32m.\e[0m" : "\e[1m\e[31mF\e[0m"
      sleep 0.1
    end

    def to_equal(expected)
      assert(@actual == expected)
    end

    def not_to_equal(expected)
      assert(@actual != expected)
    end
  end
end

# arrange || given
record = Record.find(1)
record.initial_amount = 20

# act || when
result = record.amount

# assert || then
expect_actual = EasySpec::ExpectationTarget.new(result)
expect_actual.to_equal(25)
expect_actual.not_to_equal(25)

puts "\n\ntests finished"
