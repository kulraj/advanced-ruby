class StringDerived < String
  def exclude?(substring)
    !include?(substring)
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
