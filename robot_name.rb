class Robot 
  attr_reader :name 
  @@running_list = []

  def initialize
    reset
  end

  def reset 
    @name = generate_name
    @@running_list << @name
  end

  private 

  def generate_name 
    name = ''
    loop do 
      name = ('A'..'Z').to_a.sample + ('A'..'Z').to_a.sample + rand(999).to_s
      unless @@running_list.include?(name)
        @@running_list << name 
        break 
      end
    end
    name 
  end
end
