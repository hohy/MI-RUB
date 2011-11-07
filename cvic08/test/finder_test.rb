$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require_relative '../lib/anagram/finder'
require 'test/unit'

class TestFinder < MiniTest::Unit::TestCase
  def test_find
    finder = Anagram::Finder.new("test/dict.txt");
    result = finder.find_word("code")
    expected = ["coed", "code"]
    assert_equal(expected, result)
  end
  
  def test_find2
    finder = Anagram::Finder.new("test/dict.txt");
    result = finder.find_word("teaching")
    expected = ["teaching", "cheating"]
    assert_equal(expected, result)    
  end
end
