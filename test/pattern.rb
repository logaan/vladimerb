require File.dirname(File.expand_path(__FILE__)) + "/test_helper.rb"
require File.dirname(File.expand_path(__FILE__)) + "/../src/pattern.rb"

class PatternTest < Test::Unit::TestCase
  def tests_a_value_matches_a_regex
    assert_errors Candidate.new("Fred", 50),
                  Pattern.new(:name, /ed/),
                  []
  end

  def tests_a_value_does_not_match_a_regex
    assert_errors Candidate.new("Fred", 24),
                  Pattern.new(:name, /ill/),
                  ["name is not formatted correctly."]
  end

  def tests_a_value_does_not_match_a_regex_and_gives_custom_error_message
    assert_errors Candidate.new("Fred", 24),
                  Pattern.new(:name, /ill/, message: "Name is insufficiently ill"),
                  ["Name is insufficiently ill"]
  end

end

