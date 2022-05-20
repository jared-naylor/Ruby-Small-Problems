class Triangle 
  def initialize(side1, side2, side3)
    raise ArgumentError unless valid?(side1, side2, side3)
    @sides = [side1, side2, side3]
  end

  def kind 
    case @sides.uniq.size 
    when 1 then 'equilateral'
    when 2 then 'isosceles'
    else 
      'scalene'
    end
  end

  def valid?(s1, s2, s3)
    [s1, s2, s3].none? {|side| side <= 0 } && s2 + s1 > s3 && 
    s3 + s2 > s1 && s1 + s3 > s2
  end

end

