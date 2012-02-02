require_relative 'being'

module TaM
  class Theseus < TaM::Being
    def initialize
      super
    end
    
    def find_next_tunnel
      result = nil
      @position.mark(:theseus)
      @position.tunnels.each { |tunnel|
        if tunnel.marks.include?(:minotaurus) and not tunnel.marks.include?(:theseus)    # timto tunelem sel minotaur
          @position.light_candle          
                                                # tunel ktery sel minotaur 
            tunnel.mark(:theseus)               # ale jeste jim nesel theseus -> urcite pujdeme tudy
            return tunnel                       # Pokud uz jim sel i theseus, zkusime najit lepsi          
        
        elsif not tunnel.marks.include?(:theseus) and result.nil? # timto tunelem theseus jeste nesel                                    
          result = tunnel                       # a nema stopu po minotaurovi, tak pujde tudy
        end
      }
      
      if not result.nil? 
        result.mark(:theseus)
        return result
      else  # if there is no best way to go, choose random
        return @position.tunnels[rand(@position.tunnels.size)]
      end
    end
  end
end
