# frozen_string_literal: true

class RomanNumeral
  ROMAN_NUMERALS = { 1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD', 100 => 'C', 90 => 'XC',
                     50 => 'L', 40 => 'XL', 10 => 'X', 9 => 'IX', 5 => 'V', 4 => 'IV', 1 => 'I' }.freeze

  def initialize(number)
    @number = number
  end

  def to_roman
    roman_numeral = ''
    zeroes = zeroes_added
    @number.digits.reverse_each do |number|
      if ROMAN_NUMERALS[zeroes * number]
        roman_numeral += ROMAN_NUMERALS[zeroes * number]
      elsif number >= 5
        roman_numeral += ROMAN_NUMERALS[5 * zeroes]
        (number - 5).times { roman_numeral += ROMAN_NUMERALS[zeroes] }
      else
        number.times { roman_numeral += ROMAN_NUMERALS[zeroes] }
      end
      zeroes /= 10
    end
    roman_numeral
  end

  private

  def zeroes_added
    ('1' + ('0' * (@number.to_s.size - 1))).to_i
  end
end
