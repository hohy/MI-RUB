require 'test/unit'
require_relative '../lib/pentomino/piece'

class PieceTest < Test::Unit::TestCase
  def test_fpiece
    instance = Pentomino::FPiece.new
    assert_equal(3, instance.height)
    assert_equal(3, instance.width)
    assert_equal(0, instance.data[0][0])
    assert_equal(1, instance.data[0][2])
  end
  
  def test_ipiece
    instance = Pentomino::IPiece.new
    assert_equal(5, instance.height)
    assert_equal(1, instance.width)    
    assert_equal(1, instance.data[0][0])
    assert_equal(1, instance.data[4][0])
  end

  #test F piece rotation
  def test_rotate_f
    instance = Pentomino::FPiece.new
    assert_equal(0, instance.data[2][2])
    assert_equal(1, instance.data[0][2])
    instance.rotate!
    assert_equal(1, instance.data[2][2])
    assert_equal(0, instance.data[0][2])
  end
  
  #test I piece rotation
  def test_rotate_i
    instance = Pentomino::IPiece.new
    assert_equal(1, instance.width)
    assert_equal(5, instance.height)
    instance.rotate!
    assert_equal(5, instance.width)
    assert_equal(1, instance.height)
  end

  # test mirror_f
  def test_mirror
    instance = Pentomino::FPiece.new
    assert_equal(0, instance.data[0][0])
    instance.mirror!
    assert_equal(1, instance.data[0][0])
  end
  
  # test generate variants
  def test_variants
    instance = Pentomino::IPiece.new
    assert_equal(2, instance.variants.size)
    assert_equal(instance.variants[0].data[1][0],instance.variants[1].data[0][1])
  end
end
