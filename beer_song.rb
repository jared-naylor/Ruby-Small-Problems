# frozen_string_literal: true

class BeerSong
  def self.verse(number)
    case number
    when 2 then two_beers
    when 1 then one_left
    when 0 then none_left
    else
      standard(number)
    end
  end

  def self.verses(first, last)
    order = (last..first).to_a.reverse
    order.map { |number| verse(number) }.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end

  class << self
    private

    def standard(number)
      "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
      "Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n" \
    end

    def two_beers
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n" \
    end

    def one_left
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    end

    def none_left
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end
end
