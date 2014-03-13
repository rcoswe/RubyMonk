# Chapter 7 lambdas in ruby
# 
# You may have heard of lambdas before. Perhaps you've used them in other languages. 
# Despite the fancy name, a lambda is just a function... peculiarly... without a name. 
# They're anonymous, little functional spies sneaking into the rest of your code. 
# Lambdas in Ruby are also objects, just like everything else! 
# The last expression of a lambda is its return value, just like regular functions. 
# As boring and familiar as that all sounds, it gives us a lot of power.
# As objects, lambdas have methods and can be assigned to variables. Let's try it!
# 

l = lambda { "Do or do not" }
puts l.call

puts "\n-------------\n\n"

l = lambda do |string|
  if string == "try"
    return "There's no such thing" 
  else
    return "Do or do not."
  end
end
puts l.call("try") # Feel free to experiment with this
puts l.call("shit")


# Now go ahead and add a lambda to the following code which increments any number passed to it by 1.
puts "\n-------------\n\n"

Increment = lambda {|number| number + 1 } # your lambda between the braces

puts Increment.call(8)


# Lambdas vs. Blocks
# A lambda is a piece of code that you can store in a variable, and is an object. 
# The simplest explanation for a block is that it is a piece of code that can't be stored 
# in a variable and isn't an object. It is, as a consequence, significantly faster than a lambda, 
# but not as versatile and also one of the rare instances where Ruby's "everything is an object" 
# rule is broken.
# As with most things in programming, there is more to this story, but blocks are an advanced 
# topic so lets keep things simple for now. If you're interested in studying blocks in more detail, 
# take a look at our chapter on blocks in our book "Ruby Primer: Ascent" which addresses intermediate
# and advanced topics.
# Let's look at an example of a block that does the same thing as the lambda you 
# wrote in the previous exercise.
puts "\n-------------\n\n"

def demonstrate_block(number)
  yield(number)
end

puts demonstrate_block(1) { |number| number + 1 }


# Skipping the details
# It turns out that one of the most common uses for a lambda involves passing exactly one block 
# to a method which in turn uses it to get some work done. 
# You'll see this all over the place in Ruby - Array iteration is an excellent example.
# Ruby optimizes for this use case by offering the yield keyword that can call a single 
# lambda that has been implicitly passed to a method without using the parameter list.
# If you'll review the example in the previous section, you'll notice the same pattern 
# - one method, one block passed to it outside of the parameter list, and with the block called using yield.
# Now for some practice. Using what you've learned from earlier examples and exercises, make the tests pass.
puts "\n-------------\n\n"

def calculate(a, b)
  yield(a, b)
end

puts calculate(2, 3) { |a, b| a + b } #returns 5 ✔
puts calculate(2, 3) { |a, b| a - b } #returns -1 ✔
puts calculate(2, 3) { |a, b| a * b } #returns 6 ✔

