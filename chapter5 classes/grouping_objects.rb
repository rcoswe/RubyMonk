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

# The method object still maintains a relationship with the object to which it belongs so you 
# can still call it and it responds like a normal invocation of that method.

puts "-----------\n"
next_method_object = 1.method("next")
puts next_method_object.call

puts "-----------\n"
# Method that reverse the sign of an integer

def reverse_sign(an_integer)
  return 0 - an_integer
end

puts reverse_sign(100)
puts reverse_sign(-5)

puts "-----------\n"

# As you can see, even a method that does nothing at all and has no return produces an object - the nil. 
# I'm printing out the class name because printing a nil returns an empty string, so you wouldn't see anything.

def do_nothing
end

puts do_nothing.class

puts "-----------\n"
# This shows the problem which will happen if you put a return in the wrong place

def demonstrate_early_return
  return
  puts "You will never see this, because we never get here."
end

puts demonstrate_early_return.class




