require 'test/unit'
require_relative '../lib/t_a_m/tunnel'
require_relative '../lib/t_a_m/cave'

class TunnelTest < Test::Unit::TestCase
  def test_marks
    ca = TaM::Cave.new("A")
    cb = TaM::Cave.new("B")
    instance = TaM::Tunnel.new("Test tunnel", ca, cb)
    assert_false(instance.marked?(:mark))
    instance.mark(:mark)
    assert_true(instance.marked?(:mark))
    assert_false(instance.marked?(:other_mark))
    instance.mark(:other_mark)
    assert_true(instance.marked?(:other_mark))
    assert_true(instance.marked?(:mark))
  end
  
  def test_eql
    ca = TaM::Cave.new("AB")
    cb = TaM::Cave.new("B")
    tunnel_ab = TaM::Tunnel.new("AB", ca, cb)
    tunnel_xab = TaM::Tunnel.new("AB", ca, cb)
    tunnel_nab = TaM::Tunnel.new("NAB", ca, cb)
    assert_true(tunnel_ab == tunnel_xab)
    assert_false(tunnel_ab == tunnel_nab)
    assert_false(tunnel_ab == ca)
  end  
  
  def test_to_s
    ca = TaM::Cave.new("A")
    cb = TaM::Cave.new("B")
    tunnel_ab = TaM::Tunnel.new("AB", ca, cb)
    assert_equal("Tunnel AB A-B", tunnel_ab.to_s)
  end
end
