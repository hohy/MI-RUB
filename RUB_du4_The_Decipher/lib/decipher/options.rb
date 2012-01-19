require 'optparse'

module Decipher
  class Options
    attr_reader :in_file
    attr_reader :out_file
    attr_reader :key
    def initialize(argv)
      @options = {}
      @key = 7
      parse(argv)
    end

    private    
    def parse(argv)
      OptionParser.new do |opts|  
        opts.banner = "Usage:  decipher [ options ]"

        opts.on("-f", "--input-file path", String, "Input file") do |file|
          @in_file = file
        end 
        
        opts.on("-o", "--output-file path", String, "Output file") do |file|
          @out_file = file
        end
        
        opts.on("-k", "--key number", Integer, "Decryption key") do |key|
          @key = key
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
