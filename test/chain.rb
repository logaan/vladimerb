require File.dirname(File.expand_path(__FILE__)) + "/test_helper.rb"
require File.dirname(File.expand_path(__FILE__)) + "/../src/required.rb"
require File.dirname(File.expand_path(__FILE__)) + "/../src/chain.rb"
require File.dirname(File.expand_path(__FILE__)) + "/../src/greater_than.rb"
require File.dirname(File.expand_path(__FILE__)) + "/../src/join.rb"

class ChainTest < Test::Unit::TestCase
  def test_shows_first_error
    assert_errors Candidate.new(nil, nil),
                  Chain.new(Required.new(:name),
                            Required.new(:age)),
                  ["name is required."]
  end

  def test_shows_first_error_set_in_tree
    assert_errors Candidate.new(nil, nil),
                  Chain.new(
                    Join.new(Required.new(:name),
                             Required.new(:age)),
                    GreaterThan.new(:age, 18)),
                  ["name is required.", "age is required."]
  end
end
