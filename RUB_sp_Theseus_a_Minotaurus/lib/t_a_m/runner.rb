require_relative 'options'
require_relative 'map'
require_relative 'theseus'
require_relative 'minotaurus'
require 'graphviz'

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
        # Generate random map
        @map.generate(@options.caves_num, @options.tunnels_num)
      end
      
      # Place Minotaurus and Theseus on the map
      @theseus = TaM::Theseus.new
      if @options.the_pos.nil?        
        @options.the_pos = rand(@map.tunnels.size+1)              
      end
      @theseus.position = @map.tunnels[@options.the_pos-1]
      @theseus.position.mark(:theseus)
      
      @minotaurus = TaM::Minotaurus.new
      if @options.min_pos.nil?
        @options.min_pos = rand(@map.tunnels.size+1)
      end
      @minotaurus.position = @map.tunnels[@options.min_pos-1]
      @minotaurus.position.mark(:minotaurus)
      
      #init output
      init_output      
      
      # main cycle
      @steps = []      
      write_current_state(0) # write initial state      
      @steps << [@theseus.position.id, @minotaurus.position.id]
      while (not @theseus.position == @minotaurus.position) and @options.steps_limit > @steps.size        
        @theseus.make_step
        @minotaurus.make_step        
        write_current_state(@steps.size)
        @steps << [@theseus.position.id, @minotaurus.position.id]
      end
      
      # evaluate result
      @theseus.position.accept(self)
    end
    
    # Potkají-li se na chodbě, je zabit Theseus.
    def visit_cave(cave)
      result = "Minotaurus is winner."
      puts result
      write_output(result)
    end
    
    # Pokud potká Minotaura v jeskyni, zabije ho.
    def visit_tunnel(tunnel)
      result = "Theseus is winner."
      puts result
      write_output(result)
    end
    
    def write_current_state(out_file) 

      if not @options.output.nil?              
        g = GraphViz.new(:G, :type => :graph)
        g[:size] = "7,7"        
        
        @map.caves.each { |id, cave|
          color = "white"          
          color = "lightblue" if cave.marked?(:theseus)
          color = "pink" if cave.marked?(:minotaurus)
          color = "lightblue:pink" if cave.marked?(:minotaurus) and cave.marked?(:theseus)
          color = "blue" if cave == @theseus.position
          color = "red" if cave == @minotaurus.position
          color = "magenta" if cave == @minotaurus.position and cave == @theseus.position

          fillcolor = "black"
          fillcolor = "yellow" if cave.candle

          g.add_nodes(cave.id, "fillcolor" => color, "color" => fillcolor, "penwidth" => 3, "style" => "filled")
        }

        @map.tunnels.each { |tunnel|
          color = "black"

          color = "lightblue" if tunnel.marks.include?(:theseus)
          color = "pink" if tunnel.marks.include?(:minotaurus)
          color = "lightblue:pink" if tunnel.marks.include?(:minotaurus) and tunnel.marks.include?(:theseus)
          color = "blue" if tunnel == @theseus.position
          color = "red" if tunnel == @minotaurus.position
          color = "magenta" if tunnel == @minotaurus.position and tunnel == @theseus.position

          g.add_edges(tunnel.cave_a.id, tunnel.cave_b.id, "color" => color, "penwidth" => "3", "labelfontsize" => "10", "label" => "#{tunnel.id}")
        }

        g.output( :png => "#{@options.output}/#{out_file}.png" )      
      end
    end
    
    def init_output
      if not @options.output.nil?
        if not File.directory?(@options.output) 
          Dir.new(@options.output)
        end
      end
    end
    
    def write_output(result)
      if not @options.output.nil?
        File.open("#{@options.output}/result.html", "w") { |f| 
          f.write (<<eos
<?xml version="1.0" encoding="utf-8"?>          
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML Basic 1.1//EN"
    "http://www.w3.org/TR/xhtml-basic/xhtml-basic11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
 <title>Result of Minotaurus and Theseus fight</title>
</head>
<body>
<h1>#{result}</h1>
eos
          )
          (@steps.size-1).downto(0) { |i|
            f.write("<p><b>Step #{i}</b> - Theseus position: #{@steps[i][0]}, Minotaurus position: #{@steps[i][1]}</p>\n")
            f.write("<img src=\"#{i}.png\" alt=\"Step #{i}\" />\n")            
          }
          
          f.write (
<<eos
</body>
</html>
eos
          )
        }
        puts "Result is written in #{@options.output}/result.html file." 
      end
    end
    
  end
end
