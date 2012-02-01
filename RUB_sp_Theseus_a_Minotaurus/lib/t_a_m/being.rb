module TaM
  
  # Superclass for beings (Theseus and Minotaurus) on map.
  class Being
    
    attr_accessor :position
    def initialize      
      @path = []
    end
    
    # use visitor pattern to figure out if being is in tunnel or in cave
    def make_step()
      @position.accept(self)
    end
    
    # make step in tunnel
    def visit_tunnel(tunnel) 
      if @path.size > 0
        # find other end of tunnel
        if @path.last == tunnel.cave_a
          target = tunnel.cave_b
        else
          target = tunnel.cave_a
        end
      else
        # first step - randomly choose direction of movement
        if rand > 0.5 
          target = tunnel.cave_a
        else
          target = tunnel.cave_b
        end
      end
      
      @path << @position
      @position = target      
    end
    
    # make step in cave
    def visit_cave(cave)
      target = find_next_tunnel
      @path << @position
      @position = target
    end
        
  end
end
