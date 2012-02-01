require_relative 'options'
require_relative 'map'
require_relative 'theseus'
require_relative 'minotaurus'

module TaM
  class Runner
    def initialize(argv)
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
        @options.the_pos = rand(map.tunnels.size+1)              
      end
      @theseus.position = @map.tunnels[@options.the_pos-1]
      
      @minotaurus = TaM::Minotaurus.new
      if @options.min_pos.nil?
        @options.min_pos = rand(@map.tunnels.size+1)
      end
      @minotaurus.position = @map.tunnels[@options.min_pos-1]
      
      # main cycle
      while not @theseus.position == @minotaurus.position
        @theseus.make_step
        @minotaurus.make_step
      end
      
      # evaluate result
      @theseus.position.accept(self)
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
