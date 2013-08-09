#Prompt the user for a method name and a single line of code; then actually define the method and call it

class Prompt
  def initialize(method_name)
    @method_name = method_name
  end
  def addMethod( method_name, &block )
    self.class.send( :define_method, method_name , &block )
  end
  define_method("#{@method_name}") do |&block|
  end
end

print "Enter the method name: "
method_name = gets.chomp
puts "Enter a line of code:"
line_code = gets
prompt = Prompt.new(method_name)
prompt.addMethod(method_name) { eval "#{line_code}" }
prompt.send(method_name)
