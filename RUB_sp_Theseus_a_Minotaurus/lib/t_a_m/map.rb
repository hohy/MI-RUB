require_relative 'cave'
require_relative 'tunnel'

module TaM
  # Class represents map. Contains caves and tunnels between them.
  class Map
    # Caves on map
    attr_reader :caves
    # Tunnels between caves.
    attr_reader :tunnels
    def initialize
      @caves = {}
      @tunnels = []
    end
    
    # Load map from file.
    # Format of the file:
    # Every line represents one tunnel between two caves.
    # <tt>CaveA CaveB
    # CaveA CaveC
    # CaveB CaveC</tt>
    def load_map_from_file(src_file)
      File.open(src_file, "r") { |f| 
        f.lines.each { |line| 
          cave_a = line.split[0]
          cave_b = line.split[1]
          
          add_cave(TaM::Cave.new(cave_a))
          add_cave(TaM::Cave.new(cave_b))
          
          tunnel = TaM::Tunnel.new(@tunnels.size, @caves[cave_a], @caves[cave_b])          
          add_tunnel(tunnel)
          @caves[cave_a].add_tunnel(tunnel)
          @caves[cave_b].add_tunnel(tunnel)
        }
      }
    end
    
    # Generate random map with +caves_num+ number of caves interconnected by
    # +tunnels_num+ of tunnels.
    def generate(caves_num, tunnels_num)
       caves_num.times { |i|
          add_cave(TaM::Cave.new("C#{i}"))
        }
        tunnels_num.times { |i|
          a = @caves["C#{rand(caves_num)}"]
          b = @caves["C#{rand(caves_num)}"]
          tunnel = TaM::Tunnel.new("T#{i}", a, b)
          a.add_tunnel(tunnel)
          b.add_tunnel(tunnel)
          add_tunnel(tunnel)
        }
    end
    
    # adds new cave to map
    def add_cave(new_cave)
      @caves[new_cave.id] = new_cave if not @caves.has_key?(new_cave.id)
    end
    
    # adds new tunnel to map
    def add_tunnel(tunnel)
      @tunnels << tunnel
    end
    
  end
end
