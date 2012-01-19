require 'test/unit'
require_relative '../lib/decipher/options'

class TestOptions < Test::Unit::TestCase
  
  def test_options_file
    ops = Decipher::Options.new(["-f", "input.txt"])
    expected = "input.txt"
    result = ops.in_file
    assert_equal(expected, result)
  end
  
end