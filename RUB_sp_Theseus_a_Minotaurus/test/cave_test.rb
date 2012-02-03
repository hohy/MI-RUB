require 'test/unit'
require_relative '../lib/t_a_m/cave'
require_relative '../lib/t_a_m/tunnel'

class CaveTest < Test::Unit::TestCase

  def test_marks
    instance = TaM::Cave.new("Test cave")
    assert_equal(false, instance.marked?(:mark))
    instance.mark(:mark)
    assert_equal(true, instance.marked?(:mark))
    assert_equal(false, instance.marked?(:other_mark))
    instance.mark(:other_mark)
    assert_equal(true, instance.marked?(:other_mark))
    assert_equal(true, instance.marked?(:mark))
  end

  def test_candle
    instance = TaM::Cave.new("Test cave")
    assert_equal(false, instance.candle)
    instance.light_candle
    assert_equal(true, instance.candle)
  end
  
  def test_add_tunnel
    instance = TaM::Cave.new("A")
    cb = TaM::Cave.new("B")
    tunnel = TaM::Tunnel.new("tunnel", instance, cb)
    assert_equal(true, instance.tunnels.empty?)
    instance.add_tunnel(tunnel)
    assert_equal([tunnel], instance.tunnels)
  end
  
  def test_eql
    instance_a = TaM::Cave.new("A")
    instance_b = TaM::Cave.new("B")
    instance_other_a = TaM::Cave.new("A")
    tunnel_a = TaM::Tunnel.new("A", instance_a, instance_b)
    
    assert_equal(true, instance_a == instance_other_a)
    assert_equal(false, instance_a == instance_b)
    assert_equal(false, instance_a == tunnel_a)    
  end
  
  def test_to_s
    ca = TaM::Cave.new("A")
    cb = TaM::Cave.new("B")
    cc = TaM::Cave.new("C")
    tab = TaM::Tunnel.new("ab", ca, cb)
    ca.add_tunnel(tab)
    cb.add_tunnel(tab)
    tbc = TaM::Tunnel.new("bc", cb, cc)
    cb.add_tunnel(tbc)
    cc.add_tunnel(tbc)
    
    assert_equal("Cave A, tunnels: ab ", ca.to_s)
    assert_equal("Cave B, tunnels: ab bc ", cb.to_s)
  end
end
