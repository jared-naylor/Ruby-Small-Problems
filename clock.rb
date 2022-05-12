## 'clock' class to determine the time
class Clock
  attr_accessor :hours, :minutes

  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24
  MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

  def initialize(hours, minutes = 0)
    @hours = hours
    @minutes = minutes
    @total_minutes = total_minutes
    @total_minutes = MINUTES_PER_DAY if @total_minutes.zero?
  end

  def self.at(hours, minutes = 0)
    Clock.new(hours, minutes)
  end

  def to_s
    format('%.02d:%.02d', @hours, @minutes)
  end

  def -(other)
    other = regulate_minutes(other)
    total = @total_minutes
    total < other ? total += MINUTES_PER_DAY : total
    total -= other
    @hours, @minutes = total.divmod(60)
    self
  end

  def +(other)
    total = @total_minutes + other
    total > MINUTES_PER_DAY ? total = regulate_minutes(total) : total
    @hours, @minutes = total.divmod(60)
    self
  end

  def ==(other)
    to_s == other.to_s
  end

  private

  def total_minutes
    (hours * MINUTES_PER_HOUR) + minutes
  end

  def regulate_minutes(number)
    number % MINUTES_PER_DAY
  end
end
