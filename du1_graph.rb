#!/usr/bin/ruby
$debug = false

class Node
  attr_accessor :neighbours
  attr_accessor :content
  attr_accessor :state
  def initialize(content, neighbours, state=:FRESH)
    @content = content
    @neighbours = neighbours
    @state = state
  end
  def  to_s
     "Node with content #{content} and neighbouts #{neighbours}"
   end
end

class Graph
  attr_accessor :nodes
  attr_accessor :root
  def initialize(nodes, root)
    @nodes = nodes
    @root = root
  end
  def to_s
    "Graph - root: #{root}, nodes: #{nodes}"
  end
end

def bfs(graph)
  puts "BFS method" if $debug
  queue = []
  marked = []
  queue << graph.root
  while not queue.empty? do
    node = graph.nodes[queue.delete_at(0)]
    puts "Working with node: #{node}" if $debug
    puts "Marked: #{marked}" if $debug
    puts "Queue: #{queue}" if $debug
    print node.content," "
    marked << node.content
    node.neighbours.each do |w|
      if not marked.include?(w)
        queue << w
        marked << w
      end
    end
  end
  print "\n"
end

def dfs(graph)
  puts "DFS method from node #{graph.root} - #{graph.nodes[graph.root]}" if $debug
  stack = []
  marked = []
  stack.push(graph.root)
  while not stack.empty? do
    node = graph.nodes[stack.pop]
    puts "Working with node: #{node}" if $debug
    puts "Marked: #{marked}" if $debug
    puts "Queue: #{stack}" if $debug
    print node.content," " if not marked.include?(node.content)
    marked << node.content
    node.neighbours.each do |w|
      if not marked.include?(w)
        stack.push(w)
      end
    end
  end
  print "\n"
end

# parsing number of graphs
puts "Insert number of graphs: " if $debug
graph_num = Integer(gets)
puts "Pocet grafu: #{graph_num}" if $debug
graph_cnt = 1
# for every graph parse its nodes 
graph_num.times do
  graph = Graph.new({},nil)
  
  # parse number of graph nodes
  puts "Insert number of nodes in graph:" if $debug
  nodes_num = Integer(gets)
  puts "Pocet uzlu v grafu: #{nodes_num}" if $debug  
  
  # for every node parse its connections to other
  nodes_num.times do
    # read line from input
    puts "Insert NODE_ID NEIGHBOURS_NUM N1 N2 ..." if $debug
    node_line = gets    
    node_neighbours = node_line.split

    # remove first number - its not neighbour but id of node
    node_id = Integer(node_neighbours.delete_at(0))
    # remove first number - its not neighbour but number of neighbours
    node_neighbours.delete_at(0)

    # create new instance of Node
    new_node = Node.new(node_id, [])
    node_neighbours.each do |n|
      new_node.neighbours << Integer(n)
    end
    # add node to the graph
    graph.nodes[node_id]=new_node
    puts "Zpracovan uzel: #{new_node}" if $debug
  end
  puts "graph #{graph_cnt}"
  begin
    line=gets
    graph.root=Integer(line.split[0])
    method=Integer(line.split[1])
    
    if method == 0 and not graph.root==0
      dfs(graph)
    elsif method == 1
      bfs(graph)
    end
  end while not line.start_with?("0 0")
  graph_cnt += 1
end