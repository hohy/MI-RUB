module Pentomino
  class Box
    attr_accessor :unused_pieces
    attr_reader :space
    attr_reader :width
    attr_reader :height
    def initialize(x, y)
      @width = x
      @height = y
      
      @space = Array.new(@width*@height)          
      @space.fill(0)
    end
    
    def copy(state)
      @width = state.width
      @height = state.height
      @space = state.space.dup     
      @unused_pieces = state.unused_pieces.dup
    end
    
    def [](y,x)
      @space[y*@width + x]
    end        
    
    def []=(y,x,z)
      @space[y*@width + x] = z
    end            
    
    
    # 11111   002   11111
    # 11110 + 002 = 11112
    # 00000   222   00002
    # 00000         00222
    def add(piece)      
      
      empty_field = find_empty_slot
#      for radek in 0..piece.height-1
#        for sloupec in 0..piece.width-1      
      for radek in empty_field[0]-(piece.height-1)..empty_field[0]#+piece.height-1
        for sloupec in empty_field[1]-(piece.width-1)..empty_field[1]#+piece.width-1
          if fit?(piece, radek, sloupec, empty_field[0], empty_field[1])
            result = Pentomino::Box.new(0,0)
            result.copy(self)
            result.unused_pieces.delete(piece.id)
            result.put(piece,radek,sloupec)            
            return result
          end          
        end
      end
      
    return nil  
    end   
    
    # place piece at given coordinates
    def put(piece, y, x)
       for radek in 0..piece.height-1
         for sloupec in 0..piece.width-1
           @space[(radek+y)*@width + (sloupec+x)] = piece.id if piece.data[radek][sloupec] == 1
         end
       end
    end    
    
    # checks if piece can be placed at given coordinates (x,y) and fills concrete field (fx,fy)
    def fit?(piece, y, x, fy, fx)
      #puts to_s
      return false if x + piece.width > @width or y + piece.height > @height or x < 0 or y < 0
      return false if fy < y or fx < x or piece.data[fy-y][fx-x]==0
      for radek in 0..piece.height-1
        for sloupec in 0..piece.width-1
          piece_field = piece.data[radek][sloupec] == 1
          free_field = @space[(radek+y)*@width + (sloupec+x)] == 0
          #puts "piece #{piece_field} field #{free_field}"
          return false if piece_field and not free_field                    
        end
      end
      return true
    end    
    
    
    # find first empty field to place new piece
    def find_empty_slot
      for radek in 0..@height-1
        for sloupec in 0..@width-1
          if @space[radek*@width + sloupec]==0 then 
            return [radek, sloupec]
          end          
        end
      end
      raise "No empty slot in box space."
    end
    
    def solved?
      not @space.include?(0)
    end
    
    def to_s
      str = "x:#{@width} y:#{@height}\n"
      for i in 0..@space.size-1
        if not @space[i] == 0
          str += " #{@space[i]}"  
        else
          str += "  "
        end
        
        str += "\n" if (i+1) % @width == 0
      end
      str
    end
    
  end
end

