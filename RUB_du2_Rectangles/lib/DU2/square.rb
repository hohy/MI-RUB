module DU2
  class Square
    attr_reader :size, :posx, :posy
    def initialize(size, posx, posy)
      @size = size
      @posx = posx - (size/2)
      @posy = posy - (size/2)
    end

    def area()
      size*size
    end

    def overlays?(other_square) 
      return false if posx + size < other_square.posx
      return false if posy + size < other_square.posy
      return false if other_square.posx + other_square.size < posx
      return false if other_square.posy + other_square.size < posy
      true
    end

    def overlay_area(other_square) 
      overlay_x = Square.overlay_1D(posx, posx + size, other_square.posx, other_square.posx + other_square.size)
      overlay_y = Square.overlay_1D(posy, posy + size, other_square.posy, other_square.posy + other_square.size)
      overlay_x * overlay_y
    end

    def union_area(other_square)
      area() + other_square.area() - overlay_area(other_square)
    end

    # vypocte prekryv v 1D prostoru
    def self.overlay_1D(beg_a, end_a, beg_b, end_b)

      overlay_beg = 0
      if beg_a <= beg_b
        overlay_beg = beg_b
      else 
        overlay_beg = beg_a
      end

      overlay_end = 0
      if end_a <= end_b
        overlay_end = end_a
      else
        overlay_end = end_b
      end

      overlay_end - overlay_beg
    end

  end
end
