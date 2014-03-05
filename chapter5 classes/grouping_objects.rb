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


# So, to summarize, the data an object contains is what it is and its methods 
# are what it can do. Implicit in this definition is the 
# fact that the abilities of an object are limited to the methods it exposes.

puts "-----------\n"
puts 1.next


# Methods aren't exempt from Ruby's "everything is an object" rule. 
# This means that the methods exposed by any object are themselves objects,
# and yes, you can use them as such.

# All objects in Ruby expose the eponymous method method that can be used to get hold of any of its methods as an object.

puts "-----------\n"
puts 1.method("next")






