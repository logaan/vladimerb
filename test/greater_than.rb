require File.dirname(File.expand_path(__FILE__)) + "/test_helper.rb"
require File.dirname(File.expand_path(__FILE__)) + "/../src/greater_than.rb"


class GreaterThanTest < Test::Unit::TestCase
  def tests_fails_when_number_not_greater
    over_18 = GreaterThan.new(:age, 18)
    candidate = Candidate.new("Jill", 12)
    errors = over_18.validate(candidate)
    assert_equal(["age must be over 18."], errors)
  end

  def tests_passes_when_number_is_greater
    over_18 = GreaterThan.new(:age, 18)
    candidate = Candidate.new("Jill", 24)
    errors = over_18.validate(candidate)
    assert_equal([], errors)
  end
end

