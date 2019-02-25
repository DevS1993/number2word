class NumberToWord

  DIGITS_CHARACTERS_MAPPING = {
    "2" => ["a", "b", "c"],
    "3" => ["d", "e", "f"],
    "4" => ["g", "h", "i"],
    "5" => ["j", "k", "l"],
    "6" => ["m", "n", "o"],
    "7" => ["p", "q", "r", "s"],
    "8" => ["t", "u", "v"],
    "9" => ["w", "x", "y", "z"]
  }

  DICTIONARY = []
  File.foreach("dictionary.txt") do |word|
    DICTIONARY << (word.chop.downcase)
  end

  def letter_combinations(number)
    return "Invalid Number : #{number}" if validate_input(number)

    return "Valid Number"
  end

  def validate_input(input)
    (input.nil?) || (input.length != 10) || input.include?("0") || input.include?("1")
  end
end

p NumberToWord.new().letter_combinations(nil)
p NumberToWord.new().letter_combinations("")
p NumberToWord.new().letter_combinations("123")
p NumberToWord.new().letter_combinations("6686707825")
p NumberToWord.new().letter_combinations("6686777821")
p NumberToWord.new().letter_combinations("9799592799")
