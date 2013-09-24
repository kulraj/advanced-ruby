require "csv"

class CsvParser
  attr_accessor :headers, :rows, :file_name
  def initialize(file_name)
    self.file_name = file_name
    self.headers, self.rows = get_csv_contents
  end
  def generate_path
    File.dirname($0) + "/../csv/#{ file_name }.csv"
  end
  #remove trailing 's' from filename as classname should be singular eg person if filename is persons
  def get_class_name
    "#{ file_name }".chop.capitalize
  end
  def get_csv_contents
    csv_contents = CSV.read(generate_path)
    return dasherize(csv_contents.shift), csv_contents
  end
  def dasherize(headers_with_spaces)
    headers_with_spaces.each do |header_with_spaces|
      header_with_spaces.gsub!(" ","_")
    end
  end
end