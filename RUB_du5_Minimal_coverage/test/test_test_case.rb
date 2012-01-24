require 'test/unit'
require_relative '../lib/mincover/test_case'
require_relative '../lib/mincover/segment'

class TestTestCase < Test::Unit::TestCase
  def test_init
    segments = [MinCover::Segment.new(1, 2), MinCover::Segment.new(3, 4)]
    m = 3
    instance = MinCover::TestCase.new(m, segments)
    assert_equal(3, instance.m)
    assert_equal(1, instance.segments[0].l)
    assert_equal(4, instance.segments[1].r)
  end
end
