# frozen_string_literal: true

# Anagram class
class Anagram
  def initialize(word)
    @word = word
  end

  def match(array)
    array.select do |word| 
      anagram?(@word, word) && word.downcase != @word.downcase
    end
  end

  private 

  def sorted_word(word)
    word.downcase.chars.sort 
  end

  def anagram?(word1, word2)
    sorted_word(word1) == sorted_word(word2)
  end
end
