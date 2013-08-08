#Prompt the user for a method name and a single line of code; then actually define the method and call it

class PromptMethod
  def method_missing(method_name, *args)
    eval args[0]
  end
end

print "Enter method name: "
method_name = gets.chomp
puts "Enter line of code"
line_code = gets
prompt_object = PromptMethod.new
prompt_object.method_name(line_code)
