<<-doc
Write a program interactively, through the command line
Enter a blank line to evaluate.
Enter 'q' to quit.
doc

puts "You can write your program here"
puts "Enter a blank line to evaluate."
puts "Enter 'q' to quit."
program = ""
line = ""
loop do 
  print "--> "
  line = gets
  case line.strip
  when ""
    eval(program)
    program = ""
    print "\n"
  when  /q/i
    exit
  else
    program += line
  end
end
