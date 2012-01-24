#! /usr/bin/ruby
require_relative '../lib/mincover/runner'
runner = MinCover::Runner.new(ARGV)
runner.run
