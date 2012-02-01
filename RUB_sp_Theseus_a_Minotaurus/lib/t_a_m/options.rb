require 'optparse'

module TaM
  class Options
    attr_reader :map_file
    attr_accessor :the_pos, :min_pos
    def initialize(argv)
      @options = {}
      parse(argv)
    end

    private    
    def parse(argv)
      OptionParser.new do |opts|  
        opts.banner = "Usage:  thamin [ options ]"

        opts.on("-f", "--file path", String, "Input file with map") do |mf|
          @map_file = mf
        end         
        
        opts.on("-t", "--theseus number", Integer, "Id of tunnel where Theseus is located on start") do |id|
          @the_pos = id
        end 
        
        opts.on("-m", "--minotaurus number", Integer, "Id of tunnel where Minotaurus is located on start") do |id|
          @the_pos = id
        end
        
        opts.on("-h", "--help", "Show this message") do
          puts opts
          exit
        end

        begin
          argv = ["-h"] if argv.empty?
          opts.parse!(argv)
        rescue OptionParser::ParseError => e
          STDERR.puts e.message, "\n", opts
          exit(-1)
        end
      end    
    end
   
  end
end