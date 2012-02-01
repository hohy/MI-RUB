require_relative 'being'
module TaM
  class Minotaurus < Being
    def initialize
      super
    end
        
    def find_next_tunnel
      @position.mark(:minotaurus)      
      @position.tunnels.reverse.each { |tunnel|
        if not tunnel.marks.include?(:minotaurus)   # timto tunelem minotaur jeste nesel                                    
          tunnel.mark(:minotaurus)
          return tunnel                       
        end
      }
      
      return @position.tunnels[rand(@position.tunnels.size)]      
    end    
  end  
end
