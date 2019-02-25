require_relative "NumberToWord"
require "test/unit"
 
class TestNumberToWord < Test::Unit::TestCase

  def setup
    @nu2word = NumberToWord.new()
  end
 
  def test_motortruck
    results = @nu2word.letter_combinations("6686787825")
    assert_equal(results.last, "motortruck" )
    assert(results.is_a?(Array))
  end

  def test_catamounts
    results = @nu2word.letter_combinations("2282668687")
    assert_equal(results.last, "catamounts" )
    assert_not_nil(results)
  end

  def test_returns_expected_data_type
    results = @nu2word.letter_combinations("9,00,000")
    assert(results.is_a?(String))
    assert(results.include?("Invalid"))
  end
 
end
