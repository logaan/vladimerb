require File.dirname(File.expand_path(__FILE__)) + "/test_helper.rb"
require File.dirname(File.expand_path(__FILE__)) + "/../src/pattern.rb"

class PatternTest < Test::Unit::TestCase
  def tests_a_value_matches_a_regex
    validation = Pattern.new(:name, /ed/)
    candidate = Candidate.new("Fred", 50)
    errors = validation.validate(candidate)
    assert_equal([], errors)
  end

  def tests_a_value_does_not_match_a_regex
    validation = Pattern.new(:name, /ill/)
    candidate = Candidate.new("Fred", 24)
    errors = validation.validate(candidate)
    assert_equal(["name is not formatted correctly."], errors)
  end

end

