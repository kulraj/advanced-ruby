=begin
Derive a class from String which defines a few methods on Strings, eg exclude? (opp of include).
From the command line, create an object of the new class and prompt for a method name to call on the object.
Once the user enters the method name, execute it and display the results on the command line.	
=end

require_relative "../lib/string_derived"

def take_n_args(n)
  args = []
  puts "Enter #{ n } arguments" if n > 0
  n.times do
    args << gets.strip
  end
  args
end

print "Enter the string:"
string_derived_object = StringDerived.new(gets.chomp)
puts "Enter one of the following methods:\nexclude?\npad\nnot_empty?\ncount_vowels"
puts "You can enter any method of string class also"
method_name = gets.chomp
argument_count = string_derived_object.method(method_name).arity
puts "arity = #{ argument_count }"

if argument_count < 0
  #if one argument is variable and others are fixed, we ensure at least the fixed arguments are taken
  args = take_n_args(argument_count.abs - 1)
  puts "variable number of arguments. enter blank line to finish"
  #now input the variable arguments
  loop do 
    next_argument = gets.strip
    break if next_argument == ""
    args << next_argument
  end
else
  #normal case when number of arguments are known
  args = take_n_args(argument_count)
end

puts string_derived_object.send method_name, *args