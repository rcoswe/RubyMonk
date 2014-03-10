## Chapter 6 Methods

puts "---------------------------------"
puts "  6.2 Calling a method           "
puts "---------------------------------"

# We'll expand this and talk about the ways in which methods can accept more than one parameter.

puts "-----------\n"

def add(a_number, another_number)
  a_number + another_number
end

puts add(1, 2)

# Now with 3 parameters

puts "-----------\n"

def add(a_number, another_number, yet_another_number)
  a_number + another_number + yet_another_number
end

puts add(1, 2, 3)

# Now with 3 parameters and a default 

puts "-----------\n"

def add(a_number, another_number, yet_another_number = 0)
  a_number + another_number + yet_another_number
end

puts add(1, 2)

# Call method with and without parameters

puts "-----------\n"

def say_hello(name = "Qui-Gon Jinn")
  "Hello, #{name}."
end

puts say_hello("Richard Cohen")
puts say_hello

# The list of parameters passed to an object is, in fact, available as a list. 
# To do this, we use what is called the splat operator - which is just an asterisk (*).
# The splat operator is used to handle methods which have a variable parameter list. 
# Let's use it to create an add method that can handle any number of parameters.

puts "-----------\n"

def add(*numbers)
  numbers.inject(0) { |sum, number| sum + number }
end

puts add(1)
puts add(1, 2)
puts add(1, 2, 3)
puts add(1, 2, 3, 4)

# The splat operator works both ways - you can use it to convert arrays to parameter lists
# as easily as we just converted a parameter list to an array.
# I'll show you how we can splat an array of three numbers into a parameter list so that it
# works with one of the examples from earlier in this lesson that accepts exactly three parameters.


puts "-----------\n"
def add(a_number, another_number, yet_another_number)
  a_number + another_number + yet_another_number
end

numbers_to_add = [1, 2, 3] # Without a splat, this is just one parameter
puts add(*numbers_to_add)  # Try removing the splat just to see what happens

# The splat operator with message
puts "-----------\n"

def add(*numbers)
  numbers.inject(0) { |sum, number| sum + number }
end

def add_with_message(message, *numbers)
  "#{message} : #{add(*numbers)}"
end

puts add_with_message("The Sum is", 1, 2, 3)


# Why don't you try it on for size? Create a method called introduction that accepts a person's age, 
# gender and any number of names, then returns a String that introduces that person by combining all
# of these values to create a message acceptable to the tests.
puts "-----------\n"

def introduction(age, gender, *names)
  "Meet #{names.join(' ')}, who's #{age} and #{gender}"
end

puts introduction(62, "male", "richard", "benjamin", "cohen")

# Naming parameters
# This last section on method invocation is easiest demonstrated, then explained. 
# Pay careful attention to the invocation of the add method in the example below. 
# Look at how neatly we are able to pass configuration options to the method; 
# the user of the add method gets to decide if the absolute value should be returned 
# and if rounding should happen.
puts "-----------\n"

def add(a_number, another_number, options = {})
  sum = a_number + another_number
  sum = sum.abs if options[:absolute]
  sum = sum.round(options[:precision]) if options[:round]
  sum
end

puts add(1.0134, -5.568)
puts add(1.0134, -5.568, absolute: true)
puts add(1.0134, -5.568, absolute: true, round: true, precision: 2)


