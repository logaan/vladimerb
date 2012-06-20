require_relative "test_helper"


class GreaterThanTest < Test::Unit::TestCase
  def tests_fails_when_number_not_greater
    assert_errors Candidate.new("Jill", 12),
                  GreaterThan.new(:age, 18),
                  ["age must be over 18."]
  end

  def tests_passes_when_number_is_greater
    assert_errors Candidate.new("Jill", 24),
                  GreaterThan.new(:age, 18),
                  []
  end
end

