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

require_relative "../lib/csv_parser"

print "Enter the name of csv file you want to open (persons/places) : "
str = gets.downcase.strip
csv_object = CsvParser.new(str)
ClassName = csv_object.get_class_name
objects = []

Klass = Object.const_set ClassName, Class.new {
  attr_accessor *csv_object.headers
  define_method :initialize do |values|
    csv_object.headers.each_with_index do |field, i|
      send "#{ field }=", values[i]
    end
  end
  define_method :show do
    csv_object.headers.each do |field|
      var = send "#{ field }"
      print "#{ field.capitalize }: #{ var.capitalize }, "
    end
    print "\n"
  end
  # define the methods named as per the fields   
  csv_object.headers.each do |field|
    self.class.send :define_method, field.to_sym, lambda {
      objects.each { |object| puts object.send("#{ field }").capitalize } 
    }
  end
}

csv_object.rows.each do |row|
  objects << Klass.new(row)
end

objects.each { |object| object.show }
puts "Enter the field you want to display (#{ csv_object.headers }) : "
Klass.send(gets.downcase.strip)