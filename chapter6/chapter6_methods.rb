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