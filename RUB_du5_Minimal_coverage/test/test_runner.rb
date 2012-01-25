require 'test/unit'
require 'fileutils'
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
  
  def test_solve4
    segments = [MinCover::Segment.new(-1,0), MinCover::Segment.new(-5, -3), MinCover::Segment.new(2,5), MinCover::Segment.new(0,0)]
    test_case = MinCover::TestCase.new(1, segments)
    r = MinCover::Runner.new(["-f","input/t1.txt"])    
    assert_raise(RuntimeError) {r.solve(test_case)}
  end

  def test_solve5
    segments = [MinCover::Segment.new(-1, 0), MinCover::Segment.new(0,1), MinCover::Segment.new(0,0)]
    test_case = MinCover::TestCase.new(1, segments)
    r = MinCover::Runner.new(["-f","input/t1.txt"])
    result = r.solve(test_case)
    expected_result = [MinCover::Segment.new(0,1)]
    assert_equal(expected_result, result)    
  end
  
  def test_read_input
    r = MinCover::Runner.new(["-f", "input/t1.txt"])
    r.read_input
    def r.public_test_cases
      @test_cases
    end
    expected = [MinCover::TestCase.new(1, [MinCover::Segment.new(-1,0), MinCover::Segment.new(-5, -3), 
      MinCover::Segment.new(2,5), MinCover::Segment.new(0,0)]), MinCover::TestCase.new(1, 
      [MinCover::Segment.new(-1, 0), MinCover::Segment.new(0,1), MinCover::Segment.new(0,0)])]
    assert_equal(expected, r.public_test_cases)
  end

  def test_run
    r = MinCover::Runner.new(["-f", "input/1.txt", "-o", "output/t1.txt"])
    r.run
    result = FileUtils.cmp("output/t1.txt", "output/e1.txt")
    expected = true
    assert_equal(expected, result)
  end
  
  def test_run2
    r = MinCover::Runner.new(["-f", "input/2.txt", "-o", "output/t2.txt"])
    r.run
    result = FileUtils.cmp("output/t2.txt", "output/e2.txt")
    expected = true
    assert_equal(expected, result)
  end
  
end
