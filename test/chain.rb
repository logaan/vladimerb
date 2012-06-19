require File.dirname(File.expand_path(__FILE__)) + "/test_helper.rb"
require File.dirname(File.expand_path(__FILE__)) + "/../src/required.rb"
require File.dirname(File.expand_path(__FILE__)) + "/../src/chain.rb"
require File.dirname(File.expand_path(__FILE__)) + "/../src/greater_than.rb"
require File.dirname(File.expand_path(__FILE__)) + "/../src/join.rb"

class ChainTest < Test::Unit::TestCase
  def test_shows_first_error
    name = Required.new(:name)
    age = Required.new(:age)
    both = Chain.new(name, age)
    candidate = Candidate.new(nil, nil)

    errors = both.validate(candidate)

    assert_equal(["name is required."], errors)
  end

  def test_shows_first_error_set_in_tree
    name_required   = Required.new(:name)
    age_required    = Required.new(:age)
    min_age         = GreaterThan.new(:age, 18)

    required_fields = Join.new(name_required, age_required)
    all_validations = Chain.new(required_fields, min_age)

    candidate       = Candidate.new(nil, nil)

    errors = all_validations.validate(candidate)

    assert_equal(["name is required.", "age is required."], errors)
  end
end
