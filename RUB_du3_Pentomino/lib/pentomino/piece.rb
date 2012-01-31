module Pentomino
  class Piece
    attr_accessor :data 
    attr_reader :id
    attr_reader :width
    attr_reader :height
    attr_reader :rotations
    attr_reader :symetric
    attr_reader :variants        
    
    @@pieces = {}
    
    def self.pieces
      @@pieces
    end
    
#    def self.all_pieces
#      [FPiece.new, IPiece.new, LPiece.new, NPiece.new, PPiece.new, TPiece.new, UPiece.new, VPiece.new, WPiece.new, XPiece.new, YPiece.new, ZPiece.new]
#    end
    
    def height
      @data.size
    end
    
    def width
      @data[0].size
    end
    
    # 1 2 3    4 1
    # 4 5 6 => 5 2
    #          6 3
    def rotate!
      @data = @data.transpose.map &:reverse
    end
    
    def mirror!
       @data = @data.map &:reverse
    end
    
    def ==(object)
      if object.equal?(self)
        return true
      elsif !self.class.equal?(object.class)
        return false
      end
      return object.id == @id    
    end
    
    def generate_variants
      @variants = []
      @rotations.times {
        rotate!
        var = self.dup
        var.data = Marshal.load(Marshal.dump(@data))        
        @variants << var        
      }
      if not @symetric
        self.mirror!
        @rotations.times {
          rotate!
          var = self.dup
          var.data = Marshal.load(Marshal.dump(@data))
          @variants << var        
        }
        self.mirror!
      end
      @@pieces[@id] = self
    end
  
  
  end
  
  # 0FF
  # FF0
  # 0F0
  class FPiece < Pentomino::Piece
    def initialize
      super
      @id = :F #'F'
      @rotations = 4
      @symetric = false
      @data = [[0,1,1],[1,1,0],[0,1,0]]    
      generate_variants
    end
  end
  
  class IPiece < Piece
    def initialize
      super
      @id = :I
      @rotations = 2
      @symetric = true
      @data = [[1],[1],[1],[1],[1]]
      generate_variants
    end
  end

  # L0
  # L0
  # L0
  # LL
  class LPiece < Pentomino::Piece
    def initialize
      super
      @id = :L
      @rotations = 4
      @symetric = false
      @data = [[1,0],[1,0],[1,0],[1,1]] 
      generate_variants
    end
  end

  # N0
  # N0
  # NN
  # 0N
  class NPiece < Pentomino::Piece
    def initialize
      super
      @id = :N
      @rotations = 4
      @symetric = false
      @data = [[1,0],[1,0],[1,1],[0,1]]  
      generate_variants
    end
  end
  
  # PP
  # PP
  # P0
  class PPiece < Pentomino::Piece
    def initialize
      super
      @id = :P
      @rotations = 4
      @symetric = false
      @data = [[1,1],[1,1],[1,0]] 
      generate_variants
    end
  end
  
  # TTT
  # 0T0
  # 0T0
  class TPiece < Pentomino::Piece
    def initialize
      super
      @id = :T
      @rotations = 4
      @symetric = true
      @data = [[1,1,1],[0,1,0],[0,1,0]]      
      generate_variants
    end
  end  
  
  # U0U
  # UUU
  class UPiece < Pentomino::Piece
    def initialize
      super
      @id = :U
      @rotations = 4
      @symetric = true
      @data = [[1,0,1],[1,1,1]] 
      generate_variants
    end
  end
  
  # V00
  # V00
  # VVV
  class VPiece < Pentomino::Piece
    def initialize
      super
      @id = :V
      @rotations = 4
      @symetric = true
      @data = [[1,0,0],[1,0,0],[1,1,1]]
      generate_variants
    end
  end  
  
  # W00
  # WW0
  # 0WW
  class WPiece < Pentomino::Piece
    def initialize
      super
      @id = :W
      @rotations = 4
      @symetric = true
      @data = [[1,0,0],[1,1,0],[0,1,1]]
      generate_variants
    end
  end    

  # 0X0
  # XXX
  # 0X0
  class XPiece < Pentomino::Piece
    def initialize
      super
      @id = :X
      @rotations = 2
      @symetric = true
      @data = [[0,1,0],[1,1,1],[0,1,0]]
      generate_variants
    end
  end    

  # 0Y  
  # YY
  # 0Y
  # 0Y
  class YPiece < Pentomino::Piece
    def initialize
      super
      @id = :Y
      @rotations = 4
      @symetric = false
      @data = [[0,1],[1,1],[0,1],[0,1]]
      generate_variants
    end
  end
  
  # ZZ0
  # 0Z0
  # 0ZZ
  class ZPiece < Pentomino::Piece
    def initialize
      super
      @id = :Z
      @rotations = 2
      @symetric = false
      @data = [[1,1,0],[0,1,0],[0,1,1]]
      generate_variants
    end
  end
  
end


[Pentomino::FPiece.new,
 Pentomino::IPiece.new, 
 Pentomino::LPiece.new, 
 Pentomino::NPiece.new, 
 Pentomino::PPiece.new, 
 Pentomino::TPiece.new, 
 Pentomino::UPiece.new, 
 Pentomino::VPiece.new, 
 Pentomino::WPiece.new, 
 Pentomino::XPiece.new, 
 Pentomino::YPiece.new, 
 Pentomino::ZPiece.new]
