class Diamond 

  def self.make_diamond(letter)
    distance = distance_from(letter)
    @@letters_and_spaces_hash = letter_and_spaces
    order = order(letter)
    string = order.map {|letter| @@letters_and_spaces_hash[letter].center(distance)}.join("\n")
    string += "\n"
  end
  

    
  class << self 
    private
    
    def pred(letter)
      letter = (letter.ord - 1).chr 
    end
  

    def order(letter)
      diamond_order = ('A'..letter).to_a + ('A'..pred(letter)).to_a.reverse 
      diamond_order = ['A'] if letter == 'A'
      diamond_order 
    end


    def distance_from(letter)
      letter_and_spaces[letter].size 
    end 

    def letter_and_spaces
      letters_spaces_hash = {'A' => "A"}
      counter = 1 
      ('B'..'Z').each do |letter|
        letters_spaces_hash[letter] = "#{letter}#{' ' * counter}#{letter}"
        counter += 2 
      end
      letters_spaces_hash
    end 
  end 
end

puts Diamond.make_diamond('B')
