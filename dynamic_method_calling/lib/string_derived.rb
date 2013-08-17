class StringDerived < String
  def exclude?(*args)
    !include?(args[0])
  end
  def pad
    " " + self + " "
  end
  def not_empty?
    !empty?
  end
  def count_vowels
    scan(/[aeiou]/i).count
  end
end
