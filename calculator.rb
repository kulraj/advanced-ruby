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
    self.to_f
  end

  def validate_format
    if !match(/.+\s.\s.+/)
      puts "Invalid format entered"
      exit
    end
  end

  def calculate
    operation_array = split(" ")
    # validate the two operands
    operand1 = operation_array[0].validate_number
    operand2 = operation_array[2].validate_number
    # the operator is at index 1
    operand1.send(operation_array[1].to_sym, operand2).round(2)
  end

end

puts "Enter the operation (operand1 operator operand2)\nKeep spaces to separate the operands and operator"
operation = gets.chomp
operation.validate_format
result = operation.calculate
puts result
