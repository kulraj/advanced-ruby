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
filename = gets.downcase.strip
#generate dynamic path
path_to_csv = File.dirname($0) + "/../csv/#{ filename }.csv"
#remove trailing 's' from filename as classname should be singular eg person if filename is persons
ClassName = "#{ filename }".chop.capitalize
objects = []
attributes = []
class_declared = false
CSV.foreach(path_to_csv) do |fields|
  if class_declared
    objects << Klass.new(*fields)
  else
    #name and initialize the class
    Klass = Object.const_set ClassName, Class.new {
      attr_accessor *fields
      define_method :initialize do |*values|
        fields.each_with_index { |field, i| instance_variable_set("@#{ field }", values[i]) }
      end
      define_method :show do
        fields.each do |field|
          var = instance_variable_get("@#{ field }")
          print "#{ field.capitalize }: #{ var.capitalize }, "
        end
        print "\n"
      end
      # define the methods named as per the fields   
      fields.each do |field|
        self.class.send :define_method, field.to_sym, lambda {
          objects.each { |object| puts object.instance_variable_get("@#{ field }").capitalize } 
        }
      end
    }
    attributes = fields
    class_declared = true
  end
end
objects.each { |object| object.show }
puts "Enter the field you want to display (#{ attributes }) : "
Klass.send(gets.downcase.strip)