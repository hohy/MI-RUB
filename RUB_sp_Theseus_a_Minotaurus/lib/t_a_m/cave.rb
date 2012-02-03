module TaM
  # Represents cave on map.
  class Cave
    # Unique id of the cave
    attr_reader :id
    # Tunnels from cave
    attr_reader :tunnels
    # Is candle in cave?
    attr_reader :candle
    def initialize(id)
      @id = id
      @tunnels = []
      @candle = false
      @marks = []
    end
    
    # Add mark to cave
    def mark(mark)
      @marks << mark
    end
    
    # Has cave given mark?
    def marked?(mark)
      @marks.include?(mark)
    end
    
    # Light candle in cave
    def light_candle
      @candle = true
      #puts "Candle fired in #{@id}"
    end
    
    # Add tunnel to cave
    def add_tunnel(tunnel)
      @tunnels << tunnel
    end
    
    # Method used in visitor pattern
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
      str = "Cave #{@id}, tunnels: "
      @tunnels.each {|t| str += "#{t.id} "}
      str
    end
    
  end
end
