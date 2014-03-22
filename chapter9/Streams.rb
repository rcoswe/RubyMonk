# 9.1 Streams
# I/O streams and the IO class
# An input/output stream is a sequence of data bytes that are accessed sequentially or randomly. 
# This may seem like an abstract, high-level concept -- it is! 
# I/O streams are used to work with almost everything about your computer that you can touch, see, or hear:

# printing text to the screen
# receiving key-press input from the keyboard
# playing sound through speakers
# sending and receiving data over a network
# reading and writing files stored on disk

# open the file "new-fd" and create a file descriptor:
# 
# 
puts "-----------------\n\n"
fd = IO.sysopen("new-fd", "w")

# create a new I/O stream using the file descriptor for "new-fd":
p IO.new(fd)

# fd, the first argument to IO.new, is a file descriptor. 
# This is a Fixnum value we assign to an IO object. 
# We're using a combination of the sysopen method with IO.new but we can also create IO objects 
# using the BasicSocket and File classes that are subclasses of IO. 
# We'll learn more about File in the next lesson.I warned you it would feel a bit abstract! 
# The notion of creating a "file descriptor" is inherited from UNIX, where everything is a file. 
# Because of this, you could use the above technique to open a network socket and send a message to another computer. 
# You wouldn't do that, of course -- you would probably use the BasicSocket (or perhaps TCPSocket) class we just mentioned.
# 
# Let's leave the abstract behind and find something a little more concrete. 
# There are a bunch of I/O streams that Ruby initializes when the interpreter gets loaded. 
# The list here may seem longer than if you run this locally. 
# These examples are evaluated in the dense rubymonk environment consisting of Rails, Passenger, 
# and all our other magic jui§ce.
puts "-----------------\n\n"
io_streams = Array.new
ObjectSpace.each_object(IO) { |x| io_streams << x }

p io_streams


# Standard Output, Input, and Error
# Ruby defines constants STDOUT, STDIN and STDERR that are IO objects pointing to your program's input, 
# output and error streams that you can use through your terminal, without opening any new files. 
# You can see these constants defined in the list of IO objects we printed out in the last example.

puts "-----------------\n\n"
p STDOUT.class
p STDOUT.fileno
  
p STDIN.class
p STDIN.fileno

p STDERR.class 
p STDERR.fileno


# Whenever you call puts, the output is sent to the IO object that STDOUT points to.
# It is the same for gets, where the input is captured by the IO object for STDIN 
# and the warn method which directs to STDERR.
#
# There is more to this though. The Kernel module provides us with global variables 
# $stdout, $stdin and $stderr as well, which point to the same IO objects that the 
# constants STDOUT, STDIN and STDERR point to. We can see this by checking their object_id.
# 
puts "-----------------\n\n"

p $stdin.object_id
p STDIN.object_id

puts

p $stdout.object_id
p STDOUT.object_id

puts

p $stderr.object_id
p STDERR.object_id

# As you can see, the object_ids are consistent between the global variables and constants. 
# Whenever you call puts, you're actually calling Kernel.puts (methods in Kernel are accessible everywhere in Ruby),
# which in turn calls $stdout.puts.

# So why all the indirection? The purpose of these global variables is temporary redirection: 
# you can assign these global variables to another IO object and pick up an IO stream 
# other than the one that it is linked to by default. 
# This is sometimes necessary for logging errors or capturing keyboard input you normally wouldn't. 
# Most of the time this won't be necessary... but hey, it's cool to know you can do it!

# We can use the StringIO class to easily fake out the IO objects. 
# Try to capture STDERR so that calls to warn are redirected to our custom StringIO object.
puts "-----------------\n\n"
capture = StringIO.new
$stderr = capture
p $stderr




