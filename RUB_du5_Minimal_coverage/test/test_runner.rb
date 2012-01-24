require 'test/unit'
require_relative '../lib/mincover/runner'
require_relative '../lib/mincover/segment'
require_relative '../lib/mincover/test_case'

class TestRunner < Test::Unit::TestCase
  
  def test_solve
    segments = [MinCover::Segment.new(-1, 4), MinCover::Segment.new(3, 6)]
    test_case = MinCover::TestCase.new(5, segments)
    r = MinCover::Runner.new(["-f","input/t1.txt"])
    result = r.solve(test_case)
    assert_equal(segments, result)
  end
  
  def test_solve2
    segments = [MinCover::Segment.new(-1, 5), MinCover::Segment.new(2, 7), MinCover::Segment.new(4, 11)]
    test_case = MinCover::TestCase.new(10, segments)
    r = MinCover::Runner.new(["-f","input/t1.txt"])
    result = r.solve(test_case)
    expected_result = [MinCover::Segment.new(-1, 5), MinCover::Segment.new(4, 11)]
    assert_equal(expected_result, result)
  end  

  def test_solve3
    segments = [MinCover::Segment.new(-1, 5), MinCover::Segment.new(6, 11)]
    test_case = MinCover::TestCase.new(10, segments)
    r = MinCover::Runner.new(["-f","input/t1.txt"])    
    assert_raise(RuntimeError) {r.solve(test_case)}
  end
  
end
