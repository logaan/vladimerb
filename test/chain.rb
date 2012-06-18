require File.dirname(File.expand_path(__FILE__)) + "/test_helper.rb"
require File.dirname(File.expand_path(__FILE__)) + "/../src/required.rb"
require File.dirname(File.expand_path(__FILE__)) + "/../src/chain.rb"

class ChainTest < Test::Unit::TestCase
  def test_shows_first_error
    name = Required.new(:name)
    age = Required.new(:age)
    both = Chain.new(name, age)
    candidate = Candidate.new(nil, nil)

    errors = both.validate(candidate)

    assert_equal(["name is required."], errors)
  end
end
