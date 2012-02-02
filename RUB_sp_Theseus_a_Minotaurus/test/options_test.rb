require 'test/unit'
require_relative '../lib/t_a_m/options'

class OptionsTest < Test::Unit::TestCase
  def test_parse
    instance = TaM::Options.new(["-f", "map.txt", "-o", "output", "-t", "10", "-m", "20", "-c", "50", "-e", "80", "-l", "100"])
    assert_equal("map.txt", instance.map_file)
    assert_equal("output", instance.output)
    assert_equal(10, instance.the_pos)
    assert_equal(20, instance.min_pos)
    assert_equal(50, instance.caves_num)
    assert_equal(80, instance.tunnels_num)
    assert_equal(100, instance.steps_limit)
  end
end
