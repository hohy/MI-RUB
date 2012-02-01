require_relative 'cave'
require_relative 'tunnel'

module TaM
  class Map
    attr_reader :caves
    attr_reader :tunnels
    def initialize
      @caves = {}
      @tunnels = []
    end
    
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
    
    def add_cave(new_cave)
      @caves[new_cave.id] = new_cave if not @caves.has_key?(new_cave.id)
    end
    
    def add_tunnel(tunnel)
      @tunnels << tunnel
    end
    
  end
end
