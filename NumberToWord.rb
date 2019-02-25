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
    # start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    return "Invalid Number : #{number}" if validate_input(number)

    digits_as_characters = number.chars.map{|digit| DIGITS_CHARACTERS_MAPPING[digit]}

    results = {}
    digits_count = 9 # Array indexing starts at 0
    for i in (2..digits_count)
      first_array = digits_as_characters[0..i]
      second_array = digits_as_characters[i + 1..digits_count]
      next if first_array.length < 3 || second_array.length < 3
      first_permutation = first_array.shift.product(*first_array).map(&:join)
      next if first_permutation.nil?
      second_permutation = second_array.shift.product(*second_array).map(&:join)
      next if second_permutation.nil?
      results[i] = [(first_permutation & DICTIONARY), (second_permutation & DICTIONARY)]
    end

    acceptable_words = []
    results.each do |key, value|
      next if value.first.nil? || value.last.nil?
      value.first.product(value.last).each do |combo_words|
        acceptable_words << combo_words
      end
    end

    acceptable_words << (digits_as_characters.shift.product(*digits_as_characters).map(&:join) & DICTIONARY).join(", ")

    # end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    # p "Time taken : #{((end_time - start_time) * 1000).to_i}ms"
    return acceptable_words
  end

  def validate_input(input)
    (input.nil?) || (input.length != 10) || input.include?("0") || input.include?("1")
  end
end
