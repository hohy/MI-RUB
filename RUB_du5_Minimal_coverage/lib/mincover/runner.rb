require_relative 'options'
require_relative 'segment'
require_relative 'test_case'

module MinCover
  class Runner
    def initialize(argv)
      @options = MinCover::Options.new(argv)
      @test_cases = []
    end
    
    def run
      puts "Running MinCover."      
      read_input
      @test_cases.each() { |test_case|
        begin
          solution = solve(test_case)
        rescue RuntimeError
          puts "No solution for #{test_case}."
          solution = []          
        end
        write_output(solution)
      }
      @out_file.close if not @out_file.nil?
    end
    
    def solve(test_case)
      used_segments = []
      solved_lenght = 0
      while solved_lenght < test_case.m do
        # find longest segment with l < solved_lenght
        best_segment = MinCover::Segment.new(0, 0)
        no_solution = true
        test_case.segments.each() { |s|
          if s.l <= solved_lenght and s.r > solved_lenght and s.r > best_segment.r 
            best_segment = s
            no_solution = false
          end
        }
        if no_solution
          raise "No solution for this test case exist"
          break
        end
        used_segments << best_segment
        solved_lenght = best_segment.r        
      end
      used_segments      
    end
    
    def read_input
      # open input file and read input
      File.open(@options.in_file, "r") { |f|  
        n = Integer(f.readline) # number of test cases
        n.times do |i|
          begin
            line = f.readline.strip
          end while line.length==0 # skip empty lines
          m = Integer(line)
          segments = []
          begin
            line = f.readline.strip
            l = Integer(line.split(" ")[0])
            r = Integer(line.split(" ")[1])
            segments << MinCover::Segment.new(l,r)
          end while not line=="0 0"
          @test_cases << MinCover::TestCase.new(m, segments)
        end
      }     
    end
    
    def write_output(solution)
      if not @options.out_file.nil?
        if @out_file.nil?
          @out_file = File.open(@options.out_file, "w")
        end 
        @out_file.write("#{solution.length}\n")
        solution.each { |item|           
          @out_file.write("#{item.to_s}\n")
        }                  
        @out_file.write("\n")
      end
    end
  end
end
