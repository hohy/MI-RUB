module TaM
  class Theseus < TaM::Being
    def initialize
      super
    end
    
    def find_next_tunnel
      @position.tunnels.each { |tunnel|
        if tunnel.marks.include(:minotaurus)    # timto tunelem sel minotaur
          @position.light_candle          
          result = tunnel
          if not tunnel.marks.include(:theseus) # tunel ktery sel minotaur 
            tunnel.mark(:theseus)               # ale jeste jim nesel theseus -> urcite pujdeme tudy
            return tunnel                       # Pokud uz jim sel i theseus, zkusime najit lepsi
          end
        
        elsif not tunnel.marks.include(:theseus) and result.nil? # timto tunelem theseus jeste nesel                                    
          result = tunnel                       # a nema stopu po minotaurovi, tak pujde tudy
        end
      }
      
      if not result.nil? 
        tunnel.mark(:theseus)
        return result
      else  # if there is no best way to go, choose random
        return @position.tunnels[rand(@position.tunnels.size)]
      end
    end
  end
end
