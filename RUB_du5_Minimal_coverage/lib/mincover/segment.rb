module MinCover
  class Segment
    attr_reader :l,:r 
    def initialize(li, ri)
      @l = li
      @r = ri      
    end
    
    def to_s
      "#{@l} #{@r}"
    end
    
    def ==(object)
      if object.equal?(self)
      return true
      elsif !self.class.equal?(object.class)
      return false
      end

      return object.l == @l && object.r == @r# && !object.new_record?
    end
  end
end
