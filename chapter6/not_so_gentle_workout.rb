#  Write for me three methods - calculate, add and subtract. 
#  Write add and subtract first, then have calculate call 
#  one or the other depending on the options passed. 
#  Gotchas: The inject based approach for addition won't work for subtraction, 
#  and you can't use both splatted arguments and last-parameter-is-a-hash at the same time. 
#  There's no simple way to do this - 
#  you have to check if the last argument to calculate is a Hash, 
#  then remove it from the list before calling add or subtract.


# puts RUBY_VERSION


def add (*numbers)
  	numbers.inject(0) {|sum, number| sum + number}
end

def subtract (*numbers)
	numbers.inject {|sum, number| sum - number}
end


def calculate (*input)
	if input.last.is_a?(Hash) 
		if input.last[:add]
			input.pop
			add(*input)
		elsif input.last[:subtract]
			input.pop
			subtract(*input)
		else
			puts "system error"
			puts input
		end
	else
		add(*input)
	end	
	
end

puts add(1)
puts add(1, 2)
puts add(1, 2, 3)
puts add(1, 2, 3, 4)

puts subtract(-10, 2, 3)

puts calculate(2, 7, 8, 1)

puts calculate(4, 5, add: true)

puts calculate(4, 5, subtract: true)


