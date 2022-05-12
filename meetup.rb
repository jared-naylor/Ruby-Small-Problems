# MEETUP class

require 'date'

class Meetup
  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, time_of_month)
    weekday = weekday.downcase + '?'
    time_of_month = time_of_month.downcase.to_sym
    days_in_month = create_array_of_days_in_month(weekday)
    @day = send time_of_month, days_in_month
    @day.nil? ? nil : Date.new(@year, @month, @day)
  end

  private

  def create_array_of_days_in_month(weekday)
    date_time = Date.civil(@year, @month)
    array = []
    next_month = date_time.next_month.month
    until date_time.month == next_month
      array << date_time.day if date_time.send(weekday)
      date_time = date_time.next
    end
    array
  end

  def first(array)
    array.first
  end

  def second(array)
    array[1]
  end

  def third(array)
    array[2]
  end

  def fourth(array)
    array[3]
  end

  def fifth(array)
    array[4]
  end

  def last(array)
    array.last
  end

  def teenth(array)
    array.select { |number| (13..19).include?(number) }.first
  end
end
