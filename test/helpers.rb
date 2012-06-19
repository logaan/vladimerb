require File.dirname(File.expand_path(__FILE__)) + "/test_helper.rb"
require File.dirname(File.expand_path(__FILE__)) + "/../src/helpers.rb"

class HelpersTest < Test::Unit::TestCase
  include Helpers

  def test_can_build_composite_validation_attractively
    validation = join required(:name),
                      required(:age)

    candidate = Candidate.new("Fred", 50)
    errors = validation.validate(candidate)
    assert_equal([], errors)

    candidate = Candidate.new(nil, nil)
    errors = validation.validate(candidate)
    assert_equal(["name is required.", "age is required."], errors)
  end
end
