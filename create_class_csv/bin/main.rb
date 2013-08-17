=begin
Read a csv format file and construct a new class with the name of the file dynamically. 
So if the csv is persons.csv, the ruby class should be person, if it's places.csv, the ruby class should be places
Also create methods for reading and displaying each value in "csv" file and 
values in first row of csv file will act as name of the function.
Construct an array of objects and associate each object with the row of a csv file.
For example the content of the csv file could be
name,age,city
gaurav,23,karnal
vilok,23,hissar 
=end

require "csv"

print "Enter the name of csv file you want to open (persons/places) : "
filename = gets.chomp
#generate dynamic path
path_to_csv = File.dirname($0) + "/../csv/#{filename}.csv"
#remove leading ./
path_to_csv.slice!(0..1)
puts path_to_csv
#remove trailing 's' from filename as classname should be singular eg person if filename is persons
ClassName = "#{filename}".chop.capitalize
puts ClassName
objects = []
flag = false
CSV.foreach(path_to_csv) do |line|
  if flag
    objects << Klass.new(*line)
  else
    line.each_index { |index| line[index] = line[index].to_sym }
    print line
    Klass = Object.const_set ClassName, Struct.new(*line)
    flag = true
  end
end
print objects