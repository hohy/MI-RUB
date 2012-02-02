require 'optparse'

module TaM
  class Options
    attr_reader :map_file, :output, :caves_num, :tunnels_num, :steps_limit
    attr_accessor :the_pos, :min_pos
    def initialize(argv)
      @options = {}
      @caves_num = 10 + rand(10)
      @tunnels_num = @caves_num + rand(@caves_num)
      @steps_limit = 100
      parse(argv)
    end

    private    
    def parse(argv)
      OptionParser.new do |opts|  
        opts.banner = "Usage:  thamin [ options ]"

        opts.on("-f", "--file path", String, "Input file with map") do |mf|
          @map_file = mf
        end         
        
        opts.on("-o", "--out path", String, "Output directory for results") do |out|
          @output = out
        end
        
        opts.on("-t", "--theseus number", Integer, "Id of tunnel where Theseus is located on start") do |id|
          @the_pos = id
        end 
        
        opts.on("-m", "--minotaurus number", Integer, "Id of tunnel where Minotaurus is located on start") do |id|
          @min_pos = id
        end
        
        opts.on("-c", "--caves number", Integer, "Number of caves on generated map") do |cn|
          @caves_num = cn
        end
        
        opts.on("-e", "--tunnels number", Integer, "Number of tunnels on generated map") do |cn|
          @tunnels_num = cn
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