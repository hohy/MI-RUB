$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require_relative '../lib/DU2/square'

class SquareTest < Test::Unit::TestCase
  def test_overlays?
    square_a = DU2::Square.new(10, 0, 0)
    square_b = DU2::Square.new(10, 0, 0)
    assert_equal(true, square_a.overlays?(square_b))
  end
  
  def test_overlays2?
    square_a = DU2::Square.new(10, 0, 0)
    square_b = DU2::Square.new(10, 50, 50)
    assert_equal(false, square_a.overlays?(square_b))
  end  

  def test_overlays3?
    square_a = DU2::Square.new(10, 0, 0)
    square_b = DU2::Square.new(10, -50, -50)
    assert_equal(false, square_a.overlays?(square_b))
  end    
  
  def test_overlays4?
    square_a = DU2::Square.new(10, 0, 0)
    square_b = DU2::Square.new(10, 5, 5)
    assert_equal(true, square_a.overlays?(square_b))
  end    

  def test_overlays5?
    square_a = DU2::Square.new(10, 0, 0)
    square_b = DU2::Square.new(10, -5, -5)
    assert_equal(true, square_a.overlays?(square_b))
  end
  
  def test_overlay_1D
    result = DU2::Square.overlay_1D(0, 5, 2, 7)
    expected = 3
    assert_equal(expected, result)
  end
  
  def test_overlay_1D2
    result = DU2::Square.overlay_1D(2, 7, 0, 5)
    expected = 3
    assert_equal(expected, result)
  end  
  
  def test_overlay_1D3
    result = DU2::Square.overlay_1D(0, 5, 2, 3)
    expected = 1
    assert_equal(expected, result)
  end  
  
  def test_overlay_1D4
    result = DU2::Square.overlay_1D(2, 3, 0, 5)
    expected = 1
    assert_equal(expected, result)
  end  
  
  def test_overlay_1D5
    result = DU2::Square.overlay_1D(0, 5, 0, 5)
    expected = 5
    assert_equal(expected, result)
  end  

  def test_overlay_1D6
    result = DU2::Square.overlay_1D(1, 5, -4, 2)
    expected = 1
    assert_equal(expected, result)
  end
  
  def test_overlay_1D7
    result = DU2::Square.overlay_1D(-10, -5, -11, -7)
    expected = 3
    assert_equal(expected, result)
  end  
  
  def test_overlay_area
    sq_A = DU2::Square.new(5, 0, 0)
    sq_B = DU2::Square.new(5, 2, 2)
    result = sq_A.overlay_area(sq_B)
    expected = 9
    assert_equal(expected, result)
  end

  def test_overlay_area2
    sq_A = DU2::Square.new(5, 0, 0)
    sq_B = DU2::Square.new(5, 2,-2)
    result = sq_A.overlay_area(sq_B)
    expected = 9
    assert_equal(expected, result)
  end
  
  def test_overlay_area3
    sq_A = DU2::Square.new(5, 0, 0)
    sq_B = DU2::Square.new(5, -2,-2)
    result = sq_A.overlay_area(sq_B)
    expected = 9
    assert_equal(expected, result)
  end
  
  def test_overlay_area4
    sq_A = DU2::Square.new(5, 0, 0)
    sq_B = DU2::Square.new(5, -2, 2)
    result = sq_A.overlay_area(sq_B)
    expected = 9
    assert_equal(expected, result)
  end  
  
  def test_union_area
    sq_A = DU2::Square.new(5, 0, 0)
    sq_B = DU2::Square.new(5, 1, 1)
    result = sq_A.overlay_area(sq_B)
    expected = 16
    assert_equal(expected, result)
  end  
  
  def test_union_area2
    sq_A = DU2::Square.new(4, 0, 0)
    sq_B = DU2::Square.new(2, -2, -2)
    result = sq_A.union_area(sq_B)
    expected = 19
    assert_equal(expected, result)    
  end
  
  def test_union_area3
    sq_A = DU2::Square.new(6, -3, -3)
    sq_B = DU2::Square.new(6, -3, -3)
    result = sq_A.union_area(sq_B)
    expected = 36
    assert_equal(expected, result)    
  end  
end
