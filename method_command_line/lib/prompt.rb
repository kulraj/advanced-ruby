class Prompt
  def self.add_method(method_name)
    define_method method_name do |line_code|
      eval "#{line_code}"
    end
  end
end