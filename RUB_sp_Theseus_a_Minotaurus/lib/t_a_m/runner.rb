require_relative 'options'
require_relative 'map'

module TaM
  class Runner
    def initialize
      @options = TaM::Options.new(argv)
    end
    
    def run
      # Load or generate map
      @map = TaM::Map.new
      if not @options.map_file.nil?
        @map.load_map_from_file(@options.map_file)
      else
        # TOOD: Generate random map
      end
      
      # Place Minotaurus and Theseus on the map
      @theseus = TaM::Theseus.new
      if @options.the_pos.nil?        
        @options.the_pos = @map.tunnels[rand(map.tunnels.size)]              
      end
      @theseus.position = @options.the_pos
      
      @minotaurus = TaM::Minotaurus.new
      if @options.min_pos.nil?
        @options.min_pos = @map.tunnels[rand(map.tunnels.size)]
      end
      @minotaurus.position = @options.min_pos
      
      # main cycle
      while not @theseus.position == @minotaurus.position
        @theseus.make_step
        @minotaurus.make_step
      end
      
      # evaluate result
      @theseus.position.accept(this)
    end
    
    # Potkají-li se na chodbě, je zabit Theseus.
    def visit_cave(cave)
      puts "Minotaurus is winner."
    end
    
    # Pokud potká Minotaura v jeskyni, zabije ho.
    def visit_tunnel(tunnel)
      puts "Theseus is winner."
    end
    
    
  end
end
