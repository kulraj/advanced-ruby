class ArgumentHandler

  attr_reader :minimum_arguments, :optional_parameter_count, :maximum_arguments, :args

  def initialize
    @minimum_arguments = 0
    @optional_parameter_count = 0
    @maximum_arguments = 0
    @args = []
  end

  def input_args
    take_n_args(minimum_arguments)
    take_variable_number_args(maximum_arguments - minimum_arguments)
  end

  def take_n_args(n)
    puts "Enter #{ n } arguments" if n > 0
    n.times do
      @args << gets.strip
    end
  end

  def take_variable_number_args(n)
    puts "Enter maximum #{ n } args. Enter blank line to finish"
    1.upto n do
      next_argument = gets.strip
      break if next_argument.empty?
      @args << next_argument
    end
  end

  def count_parameters(parameter_data)
    parameter_data.each do |parameter_data_element|
      case parameter_data_element[0]
      when :opt
        @optional_parameter_count += 1
      when :req
        @minimum_arguments += 1
      when :rest
        @maximum_arguments = 1.0/0
      end
    end
  end

  def display_parameters
    puts "Minimum Arguments = #{ minimum_arguments }"
    puts "Optional Arguments = #{ optional_parameter_count }"
    @maximum_arguments = optional_parameter_count + minimum_arguments if maximum_arguments.zero?
    puts "Maximum Arguments = #{ maximum_arguments }"
  end

end
