require File.dirname(File.expand_path(__FILE__)) + "/test_helper.rb"

class RequiredTest < Test::Unit::TestCase
  include Vladimerb

  def test_succeeds_for_candidate_with_name
    assert_errors Candidate.new("Fred", 50),
                  required(:name),
                  []
  end

  def test_fails_for_candidate_without_name
    assert_errors Candidate.new(nil, 24),
                  required(:name),
                  ["name is required."]
  end

  def test_fails_for_candidate_with_blank_name
    assert_errors Candidate.new("", 24),
                  required(:name),
                  ["name is required."]
  end

  def test_fails_for_candidate_without_age
    assert_errors Candidate.new("Bob", nil),
                  required(:age),
                  ["age is required."]
  end

  def test_fails_for_required_data_that_do_not_have_empty_method
    assert_errors Candidate.new("Bob", 20),
                  required(:age),
                  []
  end

  def test_fails_with_custom_error_message
    assert_errors Candidate.new(nil, 24),
                  required(:name, message: "You gotta have a name!"),
                  ["You gotta have a name!"]
  end
end

