# frozen_string_literal: true

# class to create a DNA strand obejct and compare it to other strands to determing hamming_distance
class DNA
  def initialize(sequence)
    @sequence = sequence
  end

  def hamming_distance(second_seq)
    counter = 0
    short, long = [@sequence, second_seq].sort_by(&:size)
    short.chars.each_with_index do |letter, index|
      counter += 1 unless letter == long[index]
    end
    counter
  end
end
