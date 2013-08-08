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
begin 
  print "--> "
  line = gets
  if line =~ /^\s*$/
    eval(program)
    program = ""
    print "\n"
  else
    program += line
  end
end while line !~ /^\s*q\s*$/i
