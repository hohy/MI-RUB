require 'test/unit'
require_relative '../lib/t_a_m/theseus'
require_relative '../lib/t_a_m/cave'
require_relative '../lib/t_a_m/tunnel'

class TheseusTest < Test::Unit::TestCase

  # Při vstupu do jeskyně ji Theseus opouští chodbou, která je sousední po pravé ruce, a označí ji. Je-li již označená, ignoruje ji a jde na další.
  def test_find_next_tunnel
    theseus = TaM::Theseus.new
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
    
    theseus.position = cb
    assert_equal(tab, theseus.find_next_tunnel)
    assert_equal(tbc, theseus.find_next_tunnel)
    assert_equal(tbd, theseus.find_next_tunnel)
  end
  
  # Pokud ovšem Minotaur v jeskyni byl, opouští tuto chodbu stejným vchodem, kterým ji opustil Minotaur.
  def test_find_next_tunnel2
    theseus = TaM::Theseus.new
    ca = TaM::Cave.new("A")
    cb = TaM::Cave.new("B")
    cc = TaM::Cave.new("C")
    cd = TaM::Cave.new("D")
    tab = TaM::Tunnel.new("ab", ca, cb)
    ca.add_tunnel(tab)
    cb.add_tunnel(tab)
    tbc = TaM::Tunnel.new("bc", cb, cc)
    tbc.mark(:minotaurus)
    cb.add_tunnel(tbc)
    cc.add_tunnel(tbc)
    tbd = TaM::Tunnel.new("bd", cb, cd)
    cb.add_tunnel(tbd)
    cd.add_tunnel(tbd)
    
    theseus.position = cb
    assert_equal(tbc, theseus.find_next_tunnel)
  end  
end
