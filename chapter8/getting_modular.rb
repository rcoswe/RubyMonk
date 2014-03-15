# Mixing it up
# Ruby modules allow you to create groups of methods that you can then include
# or mix into any number of classes. Modules only hold behaviour, unlike classes, 
# which hold both behaviour and state. 
# Since a module cannot be instantiated, there is no way for its methods to be called directly.
# Instead, it should be included in another class, which makes its methods available for 
# use in instances of that class. 
# There is, of course, more to this story, but let's keep it simple for now.
# In order to include a module into a class, we use the method include which takes one parameter 
# - the name of a Module.
# 

puts "\n----------------------\n\n"

module WarmUp
  def push_ups
    "Phew, I need a break!"
  end
end

class Gym
  include WarmUp
  
  def preacher_curls
    "I'm building my biceps."
  end
end

class Dojo
  include WarmUp
  
  def tai_kyo_kyu
    "Look at my stance!"
  end
end

puts Gym.new.push_ups 
puts Dojo.new.push_ups


# Some hierarchy and a little exercise.
# Just like all classes are instances of Ruby's Class, all modules in Ruby are instances of Module.
# Interestingly, Module is the superclass of Class, so this means that all classes are also modules,
# and can be used as such. For detailed lessons on inheritance in Ruby, 
# do take a look at our chapter on the subject in the "Ruby Primer: Ascent."
# 
# 

puts "\n----------------------\n\n"

module WarmUp
end

puts WarmUp.class      # Module
puts Class.superclass   # Module
puts Module.superclass  # Object


# Time for some practice! 
# As always, make the tests pass. 
# Note that the perimeter of both a square and a rectangle 
# is calculated by summing up all of its sides.
puts "\n----------------------\n\n"



# Suggested solution uese inject I used each method
# module Perimeter
#   def perimeter
#     sides.inject(0) { |sum, side| sum + side }
#   end
# end

module Perimeter
  def perimeter
  	sum = 0
  	sides.each {|entry| sum = sum + entry}
  	sum
  end
end

class Rectangle
  # Your code here
  include Perimeter
  
  def initialize(length, breadth)
    @length = length
    @breadth = breadth
  end

  def sides
    [@length, @breadth, @length, @breadth]
  end
end

class Square
  # Your code here
  include Perimeter
  
  def initialize(side)
    @side = side
  end

  def sides
    [@side, @side, @side, @side]
  end
end


r1 = Rectangle.new(3, 4)
puts r1.perimeter

s1 = Square.new(8)
puts s1.perimeter


