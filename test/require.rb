require File.dirname(File.expand_path(__FILE__)) + "/test_helper.rb"
require File.dirname(File.expand_path(__FILE__)) + "/../src/required.rb"

class RequiredTest < Test::Unit::TestCase
  def test_succeeds_for_candidate_with_name
    validation = Required.new(:name)
    candidate = Candidate.new("Fred", 50)
    errors = validation.validate(candidate)
    assert_equal([], errors)
  end

  def test_fails_for_candidate_without_name
    validation = Required.new(:name)
    candidate = Candidate.new(nil, 24)
    errors = validation.validate(candidate)
    assert_equal(["name is required."], errors)
  end

  def test_fails_for_candidate_with_blank_name
    validation = Required.new(:name)
    candidate = Candidate.new("", 24)
    errors = validation.validate(candidate)
    assert_equal(["name is required."], errors)
  end

  def test_fails_for_candidate_without_age
    validation = Required.new(:age)
    candidate = Candidate.new("Bob", nil)
    errors = validation.validate(candidate)
    assert_equal(["age is required."], errors)
  end

  def test_fails_for_required_data_that_do_not_have_empty_method
    validation = Required.new(:age)
    candidate = Candidate.new("Bob", 20)
    errors = validation.validate(candidate)
    assert_equal([], errors)
  end

  def test_fails_with_custom_error_message
    validation = Required.new(:name, message: "You gotta have a name!")
    candidate = Candidate.new(nil, 24)
    errors = validation.validate(candidate)
    assert_equal(["You gotta have a name!"], errors)
  end
end

