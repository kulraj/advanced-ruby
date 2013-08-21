class Prompt
  def self.add_method(method_name, line_code)
    define_method method_name do
      eval "#{line_code}"
    end
  end
end