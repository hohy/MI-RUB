module TaM
  class Cave
    attr_reader :id
    attr_reader :tunnels
    attr_reader :candle
    def initialize(id)
      @id = id
      @tunnels = []
      @candle = false
    end
    
    def light_candle
      @candle = true
    end
    
    def add_tunnel(tunnel)
      @tunnels << tunnel
    end
    
    def accept(being) 
      being.visit_cave(self)
    end    
    
    def ==(object) 
      if object.equal?(self)
      return true
      elsif !self.class.equal?(object.class)
      return false
      end

      return object.id == @id# && object.tunnels == @tunnels      
    end
    
    def to_s
      str = "Cave #{@id} tunnels:"
      @tunnels.each {|t| str += "#{t.id} "}
      str
    end
    
  end
end
