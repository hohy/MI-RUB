require_relative 'square'

module DU2

  class Runner
    
    def initialize(argv)
      
    end
    
    # Cteni cisel ze vstupu
    def read_and_check_input(input, disable_negative_number)
      begin
        result = Float(input)
        raise "Zaporne cislo." if result < 0 and disable_negative_number
      rescue StandardError
        puts "Spatny vstup."
        exit
      end
      result
    end

  
    def run
      print "Zadejte delku hrany prvniho ctverce: "
      size1 = read_and_check_input(gets, true)
      print "Zadejte x-ovou souradnici stredu prvniho ctverce: "
      posx1 = read_and_check_input(gets, false)
      print "Zadejte y-ovou souradnici stredu prvniho ctverce: "
      posy1 = read_and_check_input(gets, false)

      square_a = Square.new(size1, posx1, posy1)

      print "Zadejte delku hrany druheho ctverce: "
      size2 = read_and_check_input(gets, true)
      print "Zadejte x-ovou souradnici stredu druheho ctverce: "
      posx2 = read_and_check_input(gets, false)
      print "Zadejte y-ovou souradnici stredu druheho ctverce: "
      posy2 = read_and_check_input(gets, false)

      square_b = Square.new(size2, posx2, posy2)

      if not square_a.overlays?(square_b)
        puts "Ctverce se ani nedotykaji."
          exit
      end

      puts "Obsah sjednoceni dvou ctvercu je #{square_a.union_area(square_b)}."
    end
  end
end