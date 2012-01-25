# To change this template, choose Tools | Templates
# and open the template in the editor.

module MinCover
  class TestCase
    attr_reader :m, :segments 
    def initialize(m, segments)
      @m = m
      @segments = segments
    end
    
    def ==(object)
      if object.equal?(self)
        return true
      elsif !self.class.equal?(object.class)
        return false
      end

      return object.m == @m && object.segments == @segments
    end
  
  end
end
