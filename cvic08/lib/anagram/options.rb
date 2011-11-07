require 'optparse'

module Anagram
  class Options
    def initialize
      @dictionary = "/usr/share/dict/words"
    end
    
    def parse()
      OptionParser.new do |opts|  
        opts.banner = "Usage:  anagram [ options ]  word..."

        opts.on("-d", "--dict path", String, "Path to dictionary") do |dict|
          @dictionary = dict
        end 

        opts.on("-h", "--help", "Show this message") do
          puts opts
          exit
        end

        begin
          ARGV << "-h" if ARGV.empty?
          opts.parse!(ARGV)
        rescue OptionParser::ParseError => e
          STDERR.puts e.message, "\n", opts
          exit(-1)
        end
      end
      @dictionary
    end
    
  end
end
