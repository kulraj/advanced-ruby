=begin
Derive a class from String which defines a few methods on Strings, eg exclude? (opp of include).
From the command line, create an object of the new class and prompt for a method name to call on the object.
Once the user enters the method name, execute it and display the results on the command line.	
=end

require_relative "../lib/string_derived"

print "Enter the string:"
string_derived_object = StringDerived.new(gets.chomp)
puts "Enter one of the following methods:\nexclude?\npad\nnot_empty?\ncount_vowels"
method = gets.chomp
args = []
if method == "exclude?"
  print "Enter the substring to match:"
  args[0] = gets.chomp
end
puts string_derived_object.send method, *args