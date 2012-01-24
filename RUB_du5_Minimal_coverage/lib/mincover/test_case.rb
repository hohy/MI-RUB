# To change this template, choose Tools | Templates
# and open the template in the editor.

module MinCover
  class TestCase
    attr_reader :m, :segments 
    attr_accessor :solution 
    def initialize(m, segments)
      @m = m
      @segments = segments
    end
  end
end
