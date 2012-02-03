require 'test/unit'
require_relative '../lib/decipher/decip'

class DecipherTest < Test::Unit::TestCase
  def test_decrypt
    d = Decipher::Decip.new(7)
    expected = ["*CDC is the trademark of the Control Data Corporation.","*IBM is a trademark of the International Business Machine Corporation.","*DEC is the trademark of the Digital Equipment Corporation."]
    d.decrypt("input/1.txt")
    result = d.output
    assert_equal(expected, result)
  end
end
