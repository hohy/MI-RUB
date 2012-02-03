require_relative 'decip'
require_relative 'options.rb'
module Decipher

  class Runner
    def initialize (argv)
      @options = Decipher::Options.new(argv)      
    end
    
    def run
      
      d = Decipher::Decip.new(@options.key)
      result = d.decrypt(@options.in_file)
      
      # if there is specified output file, write result into it. Otherwise print it to screen.
      if @options.out_file.nil?
        result.each { |line|
          puts line
        }
      else
        File.open(@options.out_file, "w") { |f| 
          result.each { |line|
            f.write(line)
          }
        }
      end
    end
  end
end
