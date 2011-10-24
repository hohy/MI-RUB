# CVICENI 5 - VYJIMKY
class MyError < StandardError
end

begin
  raise MyError
rescue StandardError=>e
  puts " StandardError "
rescue MyError=>e
  puts "MyError"
end

begin
  raise "Raising exception!!!"
rescue RuntimeError=>e
  puts e;
  puts "Stack trace: #{e.backtrace}"
end

# CVICENI 6 - MULTITHREADING

# withou fibers
counts = Hash.new(0)

File.foreach("testfile") do |line|
  line.scan(/\w+/) do |word|
    word = word.downcase
    counts[word] += 1
  end
end
counts.keys.sort.each{|k| print "#{k}: #{counts[k]} " }

puts 

# with fibers
words = Fiber.new do
File.foreach("testfile") do |line|
  line.scan(/\w+/) do |word|
    Fiber.yield word.downcase
    end  
  end
end

counts = Hash.new(0)
while word = words.resume
  counts[word] += 1
end
counts.keys.sort.each{|k| print "#{k}: #{counts[k]} " }

print "\n"

# Fibonaciho posloupnost
a = 0;
b = 1;
fibonacci = Fiber.new do
  while true        
    c = a + b
    b = a
    a = c
    Fiber.yield c
  end
end

for i in (0..100 ) do
  value = fibonacci.resume
  puts value
end


# thready
require 'net/http'
pages = %w(www.rubycentral.com slashdot.org www.google.com)
threads = [ ]
for page_to_fetch in pages
  threads << Thread.new(page_to_fetch) do |url|
  h = Net::HTTP.new(url, 80)
  print "Fetching : #{url} \n"
  resp = h.get('/');
  print "Got #{url} : #{resp.message } \n"  
end
end
threads.each { |thr| thr.join  }





threads = [ ]
4.times do |number|
  threads << Thread.new(number) do |i|
    raise "Boom !" if i == 2
    print "#{i} \n"
  end
end

threads.each do |t| 
  begin
  t.join
rescue RuntimeError => e
  puts "Failed: #{e.message}"
  end
end



require 'thread'

queue = Queue.new
counts = Hash.new(0)

producer = Thread.new do
  File.foreach("testfile") do |line|
    line.scan(/\w+/) do |word|
      queue << word
    end
  end  
end

consumer = Thread.new do
  while queue.empty? do end
  while not queue.empty? do    
    word = queue.pop
    word = word.downcase
    counts[word] += 1  
  end
end
      
consumer.join    
counts.keys.sort.each{|k| print "#{k}: #{counts[k]} " }