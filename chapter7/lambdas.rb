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

