require File.dirname(File.expand_path(__FILE__)) + "/test_helper.rb"
require File.dirname(File.expand_path(__FILE__)) + "/../src/required.rb"
require File.dirname(File.expand_path(__FILE__)) + "/../src/join.rb"

class JoinTest < Test::Unit::TestCase
  def test_shows_all_errors
    name = Required.new(:name)
    age = Required.new(:age)
    both = Join.new(name, age)
    candidate = Candidate.new(nil, nil)

    errors = both.validate(candidate)

    assert_equal(["name is required.", "age is required."], errors)
  end
end
