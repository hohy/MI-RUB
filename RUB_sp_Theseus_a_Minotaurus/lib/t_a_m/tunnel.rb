module TaM
  class Tunnel
    include Comparable
    
    attr_reader :id, :cave_a, :cave_b, :marks
    def initialize(id, cave_a, cave_b)
      @id = id
      @cave_a = cave_a
      @cave_b = cave_b
      @marks = []
    end
    
    def mark(being) 
      @marks << being
    end
    
    def accept(being)
      being.visit_tunnel(self)
    end
    
    def ==(object) 
      if object.equal?(self)
      return true
      elsif !self.class.equal?(object.class)
      return false
      end

      return object.id == @id && object.cave_a.id == @cave_a.id && object.cave_b.id == @cave_b.id      
    end    
    
    def <=>(another_tunnel)    
      return @id<=>another_tunnel.id
    end
    
    def to_s
      "Tunnel #{@id} #{@cave_a.id}-#{@cave_b.id}"
    end
  end
end
