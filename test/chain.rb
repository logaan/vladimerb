require_relative "test_helper"

class ChainTest < Test::Unit::TestCase
  def test_shows_first_error
    assert_errors Candidate.new(nil, nil),
                  chain(required(:name),
                        required(:age)),
                  ["name is required."]
  end

  def test_shows_first_error_set_in_tree
    assert_errors Candidate.new(nil, nil),
                  Chain.new(
                    join(required(:name),
                         required(:age)),
                    greater_than(:age, 18)),
                  ["name is required.", "age is required."]
  end
end
