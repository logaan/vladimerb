require File.dirname(File.expand_path(__FILE__)) + "/test_helper.rb"
require File.dirname(File.expand_path(__FILE__)) + "/../src/predicate.rb"


class PredicateTest < Test::Unit::TestCase
  def tests_against_predicate_and_fails
    assert_errors Candidate.new("Jill", 24),
                  Predicate.new(:name, :nil?, "Name must be nil."),
                  ["Name must be nil."]
  end

  def tests_against_predicate_and_succeeds
    assert_errors Candidate.new(nil, 24),
                  Predicate.new(:name, :nil?, "Name must be nil."),
                  []
  end
end
