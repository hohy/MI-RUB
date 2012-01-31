require 'optparse'

module Pentomino
  class Options
    attr_reader :x
    attr_reader :y
    def initialize(argv)
      @options = {}
      @x = 12
      @y = 5
      parse(argv)
    end

    private    
    def parse(argv)
      OptionParser.new do |opts|  
        opts.banner = "Usage:  pentomino [ options ]"

        opts.on("-x", "--x number", Integer, "Width of pentomino box") do |x|
          @x = x
        end 
        
        opts.on("-y", "--y number", Integer, "Height of pentomino box") do |y|
          @y = y
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