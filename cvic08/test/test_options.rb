# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require_relative '../lib/anagram/options'

class TestOptions < Test::Unit::TestCase
  def test_foo
    ARGV << "hello"
    options = Anagram::Options.new
    result = options.parse
    expected = "/usr/share/dict/words"
    assert_equal(expected, result)
  end
end
