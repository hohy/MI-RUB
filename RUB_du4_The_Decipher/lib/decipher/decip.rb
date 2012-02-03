module Decipher
  class Decip
    
    attr_reader :output 
    def initialize(key)
      @key = key
      @output = []
    end
    
    def decrypt(file)
      File.open(file, 'r').each_line { |line| 
        line.strip!        
        @output << decrypt_line(line)
      }
      @output
    end
    
    private
    def decrypt_line(input_line)
      decrypted = ""
      input_line.each_char { |ch| decrypted << (ch.ord - @key) }
      decrypted
    end
    
  end
end
