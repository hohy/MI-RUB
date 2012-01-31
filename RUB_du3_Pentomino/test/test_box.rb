require 'test/unit'
require_relative '../lib/pentomino/box'
require_relative '../lib/pentomino/piece'

class TestBox < Test::Unit::TestCase
  
  def test_access_space
    instance = Pentomino::Box.new(3, 5)
    result = instance[1,4]
    expected = 0
    assert_equal(expected, result)
  end
  
  def test_write_space
    instance = Pentomino::Box.new(3, 5)
    instance[1,4] = 1
    result = instance[1,4]
    expected = 1
    assert_equal(expected, result)
  end
  
  def test_find_empty_slot
    instance = Pentomino::Box.new(5, 12)
    expected = [0,0]
    result = instance.find_empty_slot
    assert_equal(expected, result)
  end
  
  def test_find_empty_slot2
    instance = Pentomino::Box.new(5,5)
    def instance.get_space
      @space
    end
    instance.get_space.fill(1)
    instance[2,2]=0
    expected = [2,2]
    result = instance.find_empty_slot
    assert_equal(expected, result)
  end
  
  def test_find_empty_slot3
    instance = Pentomino::Box.new(5,5)
    def instance.get_space
      @space
    end
    instance.get_space.fill(1)
    instance[1,4] = 0
    instance[2,3] = 0
    expected = [1,4]
    result = instance.find_empty_slot
    assert_equal(expected, result)    
  end
  
  # basic test - puts FPiece into top left corner of empty 5,5 box
  def test_fit
    instance = Pentomino::Box.new(5, 5)
    piece = Pentomino::FPiece.new    
    assert_true(instance.fit?(piece, 0, 0, 1, 1))
  end
  
  # test borders - puts IPiece into [4,4] bottom right field of empty 5,5 box
  # should be false because piece will be out of borders of box.
  def test_fit2
    instance = Pentomino::Box.new(5, 5)
    piece = Pentomino::IPiece.new    
    assert_false(instance.fit?(piece, 4, 4, 4, 4))
  end  
  
  # test collisions - tries to put FPiece into box at field that is already filled.
  def test_fit3
    instance = Pentomino::Box.new(5, 5)
    instance[0,0] = 1
    instance[0,2] = 1
    piece = Pentomino::FPiece.new    
    assert_false(instance.fit?(piece, 0, 0, 1, 1))
  end

  # test if piece fills wanted field
  def test_fit4
    instance = Pentomino::Box.new(5,5)
    piece = Pentomino::FPiece.new
    assert_true(instance.fit?(piece, 0, 0, 0, 1))
    assert_false(instance.fit?(piece, 0, 0, 0, 0))
  end
  
  # test if piece fills wanted field
  def test_fit5
    instance = Pentomino::Box.new(3,3)
    instance[0,0] = 1
    instance[1,2] = 1
    instance[2,0] = 1
    instance[2,2] = 1
    piece = Pentomino::FPiece.new
    assert_true(instance.fit?(piece, 0, 0, 0, 1))
  end  
  
    # test if piece fills wanted field
  def test_fit6
    instance = Pentomino::Box.new(5,5)
    instance[1,2] = 1
    instance[2,4] = 1
    instance[3,2] = 1
    instance[3,4] = 1
    piece = Pentomino::FPiece.new
    assert_true(instance.fit?(piece, 1, 2, 1, 3))
  end
  
  # test put
  def test_put
    instance = Pentomino::Box.new(5,5)
    def instance.get_space
      @space
    end
    piece = Pentomino::FPiece.new
    assert_equal(0, instance.get_space[1])
    instance.put(piece, 0, 0)
    assert_equal(piece.id, instance.get_space[1])
  end
  
  # test add
  def test_add
    instance = Pentomino::Box.new(5, 5)
    instance[0,0] = 5
    instance[1,2] = 5
    instance[2,0] = 5
    instance[2,2] = 5
    instance.unused_pieces = [:F, :I]
    piece = Pentomino::FPiece.new
    solution = instance.add(piece)
    def solution.get_space
      @space
    end
    assert_equal([5,:F,:F,0,0, :F,:F,5,0,0, 5,:F,5,0,0, 0,0,0,0,0, 0,0,0,0,0], solution.get_space)
    assert_equal([:I], solution.unused_pieces)
  end
  
  # test add
  def test_add2
    instance = Pentomino::Box.new(5, 5)
    instance.unused_pieces = [:F, :I, :V]

    piece = Pentomino::IPiece.new
    instance2 = instance.add(piece)
    puts instance
    # instance should stay empty, new piece should be placed only in instance2
    assert_equal(0, instance[0,0])
    assert_equal(0, instance[1,0])
    assert_equal(0, instance[0,1])
    
    piece = Pentomino::FPiece.new
    piece.rotate!
    piece.rotate!
    piece.rotate!
    assert_equal(1, piece.data[0][0])
    instance3 = instance2.add(piece)
    
    piece = Pentomino::VPiece.new
    piece.rotate!
    piece.rotate!
    assert_equal(1, piece.data[0][0])
    assert_equal(1, piece.data[0][2])
    assert_equal(1, piece.data[2][2])
    assert_equal(0, piece.data[2][0])
    
    instance4 = instance3.add(piece)
    
    def instance4.get_space
      @space
    end
    assert_equal([:I,:F,:V,:V,:V, :I,:F,:F,:F,:V, :I,0,:F,0,:V, :I,0,0,0,0, :I,0,0,0,0], instance4.get_space)
    assert_equal([], instance4.unused_pieces)
  end  
  
  
  def test_solved
    instance = Pentomino::Box.new(2, 2)
    instance[0,0] = 'X'
    instance[0,1] = 'X'
    instance[1,0] = 'X'
    assert_false(instance.solved?)
    instance[1,1] = 'X'
    assert_true(instance.solved?)
  end
  
end
