# 8.2 Modules as Namespaces
# 
# Collision course 
# Namespacing is a way of bundling logically related objects together. 
# Modules serve as a convenient tool for this. 
# This allows classes or modules with conflicting names to co-exist while avoiding collisions. 
# Think of this as storing different files with the same names under separate directories in your filesystem.
# 
# Modules can also hold classes. 
# In this example, we'll try and define an Array class under our Perimeter module from the last lesson. 
# Notice how it does not affect Ruby's Array class at all.


# We have these two classes alongside each other. 
# This is possible because we've namespaced our version of the Array class under the Perimeter module. 
# :: is a constant lookup operator that looks up the Array constant only in the Perimeter module.

puts "-----------------\n\n"
module Perimeter
  class Array
    def initialize
      @size = 400
    end
  end
end

our_array = Perimeter::Array.new
ruby_array = Array.new

p our_array.class
p ruby_array.class


# What happens when we don't namespace our Array class?


class Array
  def initialize
    @size = 400
  end
end
 
our_array = Array.new
 
p our_array.class

# Because Ruby has open classes, doing this simply extends the Array class globally throughout the program,
# which is dangerous and of course not our intended behaviour.The examples above are a bit contrived for 
# the sake of simplicity. 
# The real problem that namespacing solves is when you're loading libraries. 
# If your program bundles libraries written by different authors, it is often the case
# that there might be classes or modules defined by the same name.

# We're assuming these two libraries gym and dojo have classes as shown in the comment above them.

puts "-----------------\n\n"

module Gym
  class Push
    def up
      40
    end
  end
end
# require "gym" # This would be required if the module was in another file

module Dojo
  class Push
    def up
      30
    end
  end
end
# require "dojo" # This would be required if the module was in another file

dojo_push = Dojo::Push.new
p dojo_push.up

gym_push = Gym::Push.new
p gym_push.up

# Constant lookup 
# We used the constant lookup (::) operator in the last section to scope our class to the module. 
# As the name suggests, you can scope any constant using this operator and not just classes.

puts "-----------------\n\n"

module Dojo
  A = 4
  module Kata
  	B = 8
    module Roulette
      class ScopeIn
        def push
          15
        end
      end
    end
  end
end

A = 16
B = 23
C = 42

puts "A - #{A}"
puts "Dojo::A - #{Dojo::A}"

puts

puts "B - #{B}"
puts "Dojo::Kata::B - #{Dojo::Kata::B}"

puts

puts "C - #{C}"
puts "Dojo::Kata::Roulette::ScopeIn.new.push - #{Dojo::Kata::Roulette::ScopeIn.new.push}"

# There are a few things going on the example above.
# Constant A is scoped within Dojo and accessing it via :: works as expected.
# Same for constant B which is nested further inside Kata. 
# Class ScopeIn is nested even deeper inside Roulette which has a method returning 15. 
# This tells us two important things. One, we can nest constant lookups as deep as we want. 
# Second, we aren't restricted to just classes and modules.

# You are given a library called RubyMonk. It contains a module Parser which defines a class CodeParser. 
# Write another class TextParser in the same namespace that parses a string and returns an array of capitalized alphabets.
puts "-----------------\n\n"

module RubyMonk
  module Parser
    class TextParser
      def self.parse(text)
        # define method
        text.upcase.split("")
      end
    end
  end
end

# f you prepend a constant with :: without a parent, the scoping happens on the topmost level. 
# In this exercise, change push to return 10 as per A = 10 in the topmost level, outside the Kata module.
puts "-----------------\n\n"
module Kata
  A = 5
  module Dojo
    B = 9
    A = 7
    
    class ScopeIn
      def push
        ::A # This will return A = 10 as declared outside module Kata - that is the topmost level
      end
    end
  end
end

A = 10

