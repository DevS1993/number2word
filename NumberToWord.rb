class NumberToWord
  def letter_combinations(digits)
    return "Invalid Number" if validate_input(digits)

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
