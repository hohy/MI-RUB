require 'test/unit'
require_relative '../lib/pentomino/runner'

class RunnerTest < Test::Unit::TestCase
  def test_solve
    instance = Pentomino::Runner.new(["-x", "5"])
  end
end
