# frozen_string_literal: true

class PerfectNumber
  def self.classify(number)
    raise StandardError unless number > 0

    case number <=> sum_of_factors(number)
    when 0 then 'perfect'
    when -1 then 'abundant'
    else
      'deficient'
    end
  end

  class << self
    private

    def sum_of_factors(number)
      (1...number).select { |factor| number % factor == 0 }.sum
    end
  end
end
