# frozen_string_literal: true

# Octal class to convert an octal number to a decimal
class Octal
  def initialize(number)
    @number = number
  end

  def to_decimal
    return 0 unless valid?

    counter = 0
    array = @number.to_i.digits
    array.each_with_index do |element, power|
      counter += element * 8**power
    end
    counter
  end

  private

  def valid?
    @number.chars.none? { |element| element > '7' } &&
      @number.chars.all? { |num| num.to_i.to_s == num }
  end
end
