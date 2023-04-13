require_relative "./logic"

# light weight specification library
module EasySpec
  def expect(actual)
    ExpectationTarget.new(actual)
  end

  def equal(expected)
    EqualMatcher.new(expected)
  end

  def be_between(expected_min, expected_max)
    BetweenMatcher.new(expected_min, expected_max)
  end

  class ExpectationTarget
    def initialize(actual)
      @actual = actual
    end

    def assert(test)
      print test ? "\e[1m\e[32m.\e[0m" : "\e[1m\e[31mF\e[0m"
      sleep 0.1
    end

    def to(matcher)
      assert(matcher.matches?(@actual))
    end

    def not_to(matcher)
      assert(!matcher.matches?(@actual))
    end
  end

  class EqualMatcher
    def initialize(expected)
      @expected = expected
    end

    def matches?(actual)
      actual == @expected
    end
  end

  class BetweenMatcher
    def initialize(expected_min, expected_max)
      @expected_min = expected_min
      @expected_max = expected_max
    end

    def matches?(actual)
      actual.between?(@expected_min, @expected_max)
    end
  end

  class ContainExactlyMatcher
    # yeah right
    # https://github.com/rspec/rspec-expectations/blob/main/lib/rspec/matchers/built_in/contain_exactly.rb
  end
end

include EasySpec

# arrange || given
record = Record.find(1)
record.initial_amount = 20

# act || when
result = record.amount

# assert || then
expect(result).to equal(25)
expect(result).not_to equal(25)
expect(result).to be_between(20, 24)

puts "\n\ntests finished"