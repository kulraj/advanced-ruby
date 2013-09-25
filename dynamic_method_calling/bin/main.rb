=begin
Derive a class from String which defines a few methods on Strings, eg exclude? (opp of include).
From the command line, create an object of the new class and prompt for a method name to call on the object.
Once the user enters the method name, execute it and display the results on the command line.	
=end

require_relative "../lib/string_derived"
require_relative "../lib/argument_handler"

print "Enter the string:"
string_derived_object = StringDerived.new(gets.chomp)
argument_handler_object = ArgumentHandler.new
puts "Enter one of the following methods:\nexclude?\npad\nnot_empty?\ncount_vowels"
puts "You can enter any method of string class also"
method_name = gets.chomp
parameter_data = string_derived_object.method(method_name).parameters
argument_handler_object.count_parameters(parameter_data)
argument_handler_object.display_parameters

argument_handler_object.input_args
puts string_derived_object.send method_name, *argument_handler_object.args