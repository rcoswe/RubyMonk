# Starting revision of older work 5 march 2014
# 

puts RUBY_VERSION

puts "---------------------------------"
puts "                                 "
puts "---------------------------------"

puts 1.class
puts "".class
puts [].class


puts "---------------------------------"
puts "                                 "
puts "---------------------------------"

puts 1.is_a?(Integer)
puts 1.is_a?(String)

puts "---------------------------------"
puts "                                 "
puts "---------------------------------"

puts 1.class.class

puts "---------------------------------"
puts "> Building your own classes      "
puts "---------------------------------"

# How to build a simple class
# and create an object and call methods

class Rectangle
  def initialize(length, breadth)
    @length = length
    @breadth = breadth
  end

  def perimeter
    2 * (@length + @breadth)
  end

  def area
    @length * @breadth
  end
end

r1 = Rectangle.new(3, 4)
puts r1.perimeter
puts r1.area









