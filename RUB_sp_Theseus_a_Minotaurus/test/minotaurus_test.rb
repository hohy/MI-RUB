require 'test/unit'
require_relative '../lib/t_a_m/minotaurus'
require_relative '../lib/t_a_m/cave'
require_relative '../lib/t_a_m/tunnel'

class MinotaurusTest < Test::Unit::TestCase
  def test_find_next_tunnel
    minotaur = TaM::Minotaurus.new
    ca = TaM::Cave.new("A")
    cb = TaM::Cave.new("B")
    cc = TaM::Cave.new("C")
    cd = TaM::Cave.new("D")
    tab = TaM::Tunnel.new("ab", ca, cb)
    ca.add_tunnel(tab)
    cb.add_tunnel(tab)
    tbc = TaM::Tunnel.new("bc", cb, cc)
    cb.add_tunnel(tbc)
    cc.add_tunnel(tbc)
    tbd = TaM::Tunnel.new("bd", cb, cd)
    cb.add_tunnel(tbd)
    cd.add_tunnel(tbd)
    
    minotaur.position = cb
    assert_equal(tbd, minotaur.find_next_tunnel)
    assert_equal(tbc, minotaur.find_next_tunnel)
    assert_equal(tab, minotaur.find_next_tunnel)
  end
end
