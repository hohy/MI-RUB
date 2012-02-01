require 'test/unit'
require_relative '../lib/t_a_m/runner'

class RunnerTest < Test::Unit::TestCase
  def test_run
    instance = TaM::Runner.new(["-f","input/test3.txt","-t","1","-m","6"])
    instance.run
  end
end
