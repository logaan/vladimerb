require_relative "test_helper.rb"

class PatternTest < Test::Unit::TestCase
  include Vladimerb

  def tests_a_value_matches_a_regex
    assert_errors Candidate.new("Fred", 50),
                  pattern(:name, /ed/),
                  []
  end

  def tests_a_value_does_not_match_a_regex
    assert_errors Candidate.new("Fred", 24),
                  pattern(:name, /ill/),
                  ["name is not formatted correctly."]
  end

  def tests_a_value_does_not_match_a_regex_and_gives_custom_error_message
    assert_errors Candidate.new("Fred", 24),
                  pattern(:name, /ill/, message: "Name is insufficiently ill"),
                  ["Name is insufficiently ill"]
  end

  def tests_a_value_can_be_blank
    assert_errors Candidate.new(nil, 24),
                  pattern(:name, /ill/, message: "Name is insufficiently ill"),
                  []
  end

end

