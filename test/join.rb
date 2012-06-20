require File.dirname(File.expand_path(__FILE__)) + "/test_helper.rb"
require File.dirname(File.expand_path(__FILE__)) + "/../src/required.rb"
require File.dirname(File.expand_path(__FILE__)) + "/../src/join.rb"

class JoinTest < Test::Unit::TestCase
  def test_shows_all_errors
    assert_errors Candidate.new(nil, nil),
                  Join.new(Required.new(:name),
                           Required.new(:age)),
                  ["name is required.", "age is required."]
  end
end
