require File.dirname(File.expand_path(__FILE__)) + "/test_helper.rb"


class PredicateTest < Test::Unit::TestCase
  include Vladimerb

  def tests_against_predicate_and_fails
    assert_errors Candidate.new("Jill", 24),
                  predicate(:name, :nil?, "Name must be nil."),
                  ["Name must be nil."]
  end

  def tests_against_predicate_and_succeeds
    assert_errors Candidate.new(nil, 24),
                  predicate(:name, :nil?, "Name must be nil."),
                  []
  end
end
