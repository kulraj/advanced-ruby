<<-doc
Write a program interactively, through the command line
Enter a blank line to evaluate.
Enter 'q' to quit.
doc

program = ""
line = ""
begin 
  print "--> "
  line = gets()
  if line.strip == ''
    eval(program)
    program = ""
    print "\n"
  else
    program += line
  end
end while !line.strip().match(/^q$/i)
