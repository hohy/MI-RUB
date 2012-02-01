require 'graphviz'

g = GraphViz.new(:G, :type => :graph)
5.times { |i|
  g.add_nodes("C#{i}")
}

g.add_edges("C1","C2")
g.add_edges("C2","C3")
g.add_edges("C3","C4")
g.add_edges("C4","C1")
g.add_edges("C4","C5")

g.output( :png => "maze.png" )


## Generate output image
#GraphViz::new( :G, :type => :graph ) { |g|
#  g._new[:label] = "new"
#  g.run << g.intr
#  g.intr << g.runbl
#  g.runbl << g.run
#  g.run << g.kernel
#  g.kernel << g.zombie
#  g.kernel << g.sleep
#  g.kernel << g.runmem
#  g.sleep << g.swap
#  g.swap << g.runswap
#  g.runswap << g._new
#  g.runswap << g.runmem
#  g._new << g.runmem
#  g.sleep << g.runmem
#}.output( :png => "#{$0}.png", :use => :fdp )
