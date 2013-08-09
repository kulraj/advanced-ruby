#Prompt the user for a method name and a single line of code; then actually define the method and call it

class String
  def method(*args)
    eval args[0]
  end
end

print "Enter the method name: "
method_name = gets.chomp
puts "Enter a line of code:"
line_code = gets
method_name.send(:method, line_code)
