require 'test/unit'
require_relative '../lib/t_a_m/being'
require_relative '../lib/t_a_m/tunnel'
require_relative '../lib/t_a_m/cave'

class Being_test < Test::Unit::TestCase

  # Being that came from Cave A, goes through tunnel, should ends in Cave B
  def test_visit_tunnel
    instance = TaM::Being.new
    ca = TaM::Cave.new("A")
    cb = TaM::Cave.new("B")
    tunnel = TaM::Tunnel.new(1, ca, cb)
    def instance.add_to_path(place)
      @path << place
    end
    instance.add_to_path(ca)
    instance.visit_tunnel(tunnel)
    assert_equal(cb, instance.position)
  end

  # tests first steps. Being is in middle of tunnel and has to go to one of caves at ends of tunnel
  def test_visit_tunnel2
    instance = TaM::Being.new
    ca = TaM::Cave.new("A")
    cb = TaM::Cave.new("B")
    tunnel = TaM::Tunnel.new(1, ca, cb)    
    instance.visit_tunnel(tunnel)
    assert_equal(true, (instance.position == ca) || (instance.position == cb))
  end
  
  # If being is in cave, in next step it should be in tunnel
  def test_visit_cave
    instance = TaM::Being.new
    ca = TaM::Cave.new("A")
    cb = TaM::Cave.new("B")
    tunnel = TaM::Tunnel.new(1, ca, cb)    
    ca.add_tunnel(tunnel)
    instance.position = ca
    def instance.find_next_tunnel
      @position.tunnels.first
    end
    instance.visit_cave(ca)
    assert_equal(tunnel, instance.position)
  end
end
