require 'test/unit'
require_relative '../lib/mincover/segment'

class TestSegment < Test::Unit::TestCase
  def test_init
    instance = MinCover::Segment.new(5,10)
    assert_equal(5, instance.l)
    assert_equal(10, instance.r)
  end  
  
  def test_eql2
    instance_a = MinCover::Segment.new(1, 5)
    instance_b = MinCover::Segment.new(1, 5)
    
    assert_equal(instance_a, instance_b)
  end  
  
  def test_eql3
    instance_a = MinCover::Segment.new(1, 5)
    instance_b = MinCover::Segment.new(0, 4)
    
    assert_not_equal(instance_a, instance_b)
  end   
end
