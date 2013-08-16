=begin
Create an instance of a class string.
Define a method on this instance in a way that it is available only on this instance. 
If you create another instance of the class and try to call this method, it should give a method not defined error.
Create this method using def something.method_name and also class << self	
=end

require_relative "../lib/string"

string_instance = "abcd"
#method1
def string_instance.method1
	puts self
end
string_instance.method

#method2
string_instance.instance_eval do
	class << self
		def method2
			puts swapcase
		end
	end
end
string_instance.method2