<<-doc
Exercise - Create a calculator (Level 1)
Define a method, which would evaluate basic arithmetic operations.
Example -
calculate 3, :+, 2
doc

class String
  def validate_number
    if !match(/^[+-]?\d+([.]\d+)?$/)
      puts "Input is not a number"
      exit
    end
    self
  end

  def calculate
    if !match(/.+\s.\s.+/)
      puts "Invalid format entered"
      exit
    end
    operation_array = split(" ")
    # validate the two operands
    operation_array[0].validate_number
    operation_array[2].validate_number
    # the operator is at index 1
    eval(self)
  end
end

puts "Enter the operation (operand1 operator operand2)\nKeep spaces to separate the operands and operator"
operation = gets.chomp
result = operation.calculate
puts result
