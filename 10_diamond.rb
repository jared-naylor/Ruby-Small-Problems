# frozen_string_literal: true

# # frozen_string_literal: true

# class Diamond
#   def self.make_diamond(letter)
#     distance = distance_from(letter)
#     @@letters_and_spaces_hash = letter_and_spaces
#     order = order(letter)
#     string = order.map { |letter| @@letters_and_spaces_hash[letter].center(distance) }.join("\n")
#     string += "\n"
#   end

#   class << self
#     private

#     def pred(letter)
#       letter = (letter.ord - 1).chr
#     end

#     def order(letter)
#       diamond_order = ('A'..letter).to_a + ('A'..pred(letter)).to_a.reverse
#       diamond_order = ['A'] if letter == 'A'
#       diamond_order
#     end

#     def distance_from(letter)
#       letter_and_spaces[letter].size
#     end

#     def letter_and_spaces
#       letters_spaces_hash = { 'A' => 'A' }
#       counter = 1
#       ('B'..'Z').each do |letter|
#         letters_spaces_hash[letter] = "#{letter}#{' ' * counter}#{letter}"
#         counter += 2
#       end
#       letters_spaces_hash
#     end
#   end
# end

# puts Diamond.make_diamond('B')

class Diamond
  attr_reader :letter

  def initialize(letter)
    @letter = letter
    @length = ('A'..letter).to_a.size
  end

  def self.make_diamond(letter)
    Diamond.new(letter).make_diamond
  end

  def make_diamond
    top_half.join("\n") + "\n" + bottom_half.join("\n") + "\n"
  end

  private

  def top_half
    result = []
    spaces = 1
    ('A'...letter).each do |letter|
      if letter == 'A'
        result << letter.center(width)
      else
        result << "#{letter}#{' ' * spaces}#{letter}".center(width)
        spaces += 2
      end
    end
    result
  end

  def bottom_half
    result = []
    spaces = width - 2
    ('A'..letter).to_a.reverse_each do |letter|
      if letter == 'A'
        result << letter.center(width)
      else
        result << "#{letter}#{' ' * spaces}#{letter}".center(width)
        spaces -= 2
      end
    end
    result
  end

  def width
    array = [0]
    odd_counter = 1
    until array.size == @length
      array << odd_counter
      odd_counter += 2
    end
    odd_counter
  end
end

puts Diamond.make_diamond('E')
