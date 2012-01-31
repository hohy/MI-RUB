require_relative 'piece'
require_relative 'options'
require_relative 'box'

module Pentomino
  class Runner
    def initialize(argv)
      @options = Pentomino::Options.new(argv)
      @DEBUG = false
    end
    
    def run
      puts "Solving pentomino #{@options.x}x#{@options.y}"
      # initial state = empty box      
      box = Pentomino::Box.new(@options.x, @options.y)            
      box.unused_pieces = Pentomino::Piece.pieces.keys.shuffle!
      @stack = [box]  
      @best_solution = box
      solve_alt
      
    end        
    
    
    def solve_alt
      while not @stack.empty?
        current_state = @stack.pop
        if current_state.unused_pieces.size < @best_solution.unused_pieces.size 
          @best_solution = current_state
        end
        if @DEBUG
          puts "Stack size: #{@stack.size} Current state: #{current_state.to_s}" if @DEBUG
          #sleep(2)
        end
        current_state.unused_pieces.each { |p|
          Pentomino::Piece.pieces[p].variants.each { |v|
            new_state = current_state.add(v)
            if not new_state.nil? 
                if not new_state.solved?
#                if @DEBUG  
#                  puts "Pushing to stack state: #{p.id} #{new_state.to_s}"         
#                  sleep(1)
#                end
                  @stack.push(new_state)
                else
                  @best_solution = new_state
                  @stack.clear
                end
            end
          }
        }
      end
      puts "SOLUTION: \n #{@best_solution.to_s} \n Left pieces: #{@best_solution.unused_pieces}"
      @solution
    end    
    
  end
end