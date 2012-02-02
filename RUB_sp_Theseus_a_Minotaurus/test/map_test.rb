require 'test/unit'
require_relative '../lib/t_a_m/map'
require_relative '../lib/t_a_m/cave'
require_relative '../lib/t_a_m/tunnel'

class MapTest < Test::Unit::TestCase
  def test_read_from_file
    instance = TaM::Map.new
    instance.load_map_from_file("input/test1.txt")
    expected = TaM::Map.new
    ["1","2"].each {|id| 
      expected.add_cave(TaM::Cave.new(id))
    }
    [["1","2"]].each_with_index { |tunnel, id| 
      new_tunnel = TaM::Tunnel.new(id, expected.caves[tunnel[0]], expected.caves[tunnel[1]])
      expected.caves[tunnel[0]].add_tunnel(new_tunnel)
      expected.caves[tunnel[1]].add_tunnel(new_tunnel)
      expected.add_tunnel(new_tunnel)
    }

    assert_equal(expected.caves, instance.caves)
    assert_equal(expected.tunnels, instance.tunnels)
  end
  
  def test_read_from_file2
    instance = TaM::Map.new
    instance.load_map_from_file("input/test2.txt")
    expected = TaM::Map.new
    ["1","2","3"].each {|id| 
      expected.add_cave(TaM::Cave.new(id))
    }
    [["1","2"],["1","3"]].each_with_index { |tunnel, id| 
      new_tunnel = TaM::Tunnel.new(id, expected.caves[tunnel[0]], expected.caves[tunnel[1]])
      expected.caves[tunnel[0]].add_tunnel(new_tunnel)
      expected.caves[tunnel[1]].add_tunnel(new_tunnel)
      expected.add_tunnel(new_tunnel)
    }

    assert_equal(expected.caves, instance.caves)
    assert_equal(expected.tunnels, instance.tunnels)
  end  
  
  def test_generate
    instance = TaM::Map.new
    assert_equal(0, instance.caves.size)
    assert_equal(0, instance.tunnels.size)    
    instance.generate(10, 20)
    assert_equal(10, instance.caves.size)
    assert_equal(20, instance.tunnels.size)
  end
end
