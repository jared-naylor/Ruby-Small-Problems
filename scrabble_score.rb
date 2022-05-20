# frozen_string_literal: true

# Scrabble class that determines score
class Scrabble
  SCRABBLE_SCORES = { %w[A E I O U L N R S T] => 1, %w[D G] => 2, %w[B C M P] => 3,
                      %w[F H V W Y] => 4, %w[K] => 5, %w[J X] => 8, %w[Q Z] => 10 }.freeze

  def initialize(word)
    @word = word
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def score
    counter = 0
    return counter unless @word =~ /^[a-z]/i

    @word.upcase.each_char do |char|
      key = SCRABBLE_SCORES.keys.select { |array| array.include?(char) }.first
      counter += SCRABBLE_SCORES[key]
    end
    counter
  end
end
