require_relative 'finder'
require_relative 'options'

options = Anagram::Options.new
dictionary = options.parse

finder = Anagram::Finder.new(dictionary)

ARGV.each do |word|
  results = finder.find_word(word)

  if results.size > 0
    puts "Anagrams of #{word}: #{results.join(', ')}"
  else
    puts "No anagrams of #{word} in #{dictionary}"
  end
end    
