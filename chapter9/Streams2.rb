# 9.2 Using the `File` Class
# Opening and closing

# Where we used IO.sysopen and IO.new to create a new IO object in the last lesson, we'll use the File class here. 
# You'll notice it's much more straight-forward!

# (Note that file.inspect will return a FakeFS::File -- this isn't a real File object because 
# otherwise your "friend-list.txt" would conflict with other rubymonk users' "friends-list.txt". 
# Don't worry -- it behaves just like a real File object. See for yourself! File#read is shown as an example.)
puts "-----------------\n\n"

mode = "r+"
file = File.open("friend-list.txt", mode)
puts file.inspect
puts file.read
file.close


# mode is a string that specifies the way you would like your file to be opened. 
# Here we're using r+, which opens the file in read-write mode, starting from the beginning. 
# w opens it in write-only mode, truncating the existing file. 
# You can take look at all the possible modes here.
# It's worth noting that there are (many!) multiple ways of opening files in Ruby. 
# File.open also takes an optional block which will auto-close the file you opened once you are done with it.
puts "-----------------\n\n"
what_am_i = File.open("clean-slate.txt", "w") do |file|
  file.puts "Call me Reuben."
end

p what_am_i

File.open("clean-slate.txt", "r") {|file| puts file.read }

# Reading and writing
# Now we'll take a look at some methods to read from an I/O stream. 
# In these examples, our I/O stream is a file, but remember: as described in the previous lesson, 
# files behave just like any other I/O stream.

# The File#read method accepts two optional arguments: 
# length, the number of bytes upto which the stream will be read, 
# and buffer, where you can provide a String buffer which will be filled with the file data. 
# This buffer is sometimes useful for performance when iterating over a file, as it re-uses an already initialized string

puts "-----------------\n\n"

file = File.open("friend-list.txt", "r+")

p file.read
file.rewind # try commenting out this line to see what happens!
            # can you guess why this happens?

buffer = ""
p file.read(23, buffer)
p buffer

file.close

# Could you guess why we had to use File#rewind before the second call to File#read? 
# It's okay if you couldn't or weren't sure. 
# The reason is actually due to Ruby's internal handling of files. 
# When reading from a File object, Ruby keeps track of your position. 
# In doing so, you could read a file one line (or page, or arbitrary chunk) at a time 
# without recalculating where you left off after the last read.
# 
# File#seek should solidify this idea even further. 
# You can "seek" to a particular byte in the file to tell Ruby where you want to start reading from. 
# If you want a particular set of bytes from the file, you can then pass the 
# length parameter to File#read to select a number of bytes from your new starting point.
# 
# If this still isn't clear, try changing the first file.read to file.read(16) and then comment out the file.
# rewind line again. The position in the file should be obvious from the second read.

# File#seek should solidify this idea even further. 
# You can "seek" to a particular byte in the file to tell Ruby where you want to start reading from. 
# If you want a particular set of bytes from the file, you can then pass the length parameter to File#read 
# to select a number of bytes from your new starting point.

puts "-----------------\n\n"

p File.read("monk")

File.open("monk") do |f|
  f.seek(20, IO::SEEK_SET)
  p f.read(10)
end


# readlines returns an array of all the lines of the opened IO stream. 
# You can, again, optionally limit the number of lines and/or insert a 
# custom separator between each of these lines.
puts "-----------------\n\n"

lines = File.readlines("monk")
p lines
p lines[0]

p lines.class  # i added these lines just to double-check that readlines returns an array.
p lines.length # i added these lines just to double-check that readlines returns an array.

# To write to an I/O stream, we can use IO#write (or, in our case, File#write) 
# and pass in a string. It returns the number of bytes that were written. 
# Try calling the method that writes "Bar" to a file named disguise.
# 

puts "-----------------\n\n"

File.open("disguise", "w") do |f|
  f.write ("Bar")
end

File.open("disguise", "r") do |f|
  puts f.read
end



