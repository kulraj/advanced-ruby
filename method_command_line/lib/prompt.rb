class Prompt
  def self.add_method( method_name, &block )
    self.send( :define_method, method_name , &block )
  end
end