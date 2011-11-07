module Anagram
  class Finder
    def initialize(dictionary)
      @dictionary = dictionary;      
    end
    
    # convert "wombat" into "abmotw". All anagrams share a signature
    def signature_of(word)
      word.unpack("c*").sort.pack("c*")
    end

    def find_word(word)
      result = Array.new
      File.foreach(@dictionary) do |line|
        anagram = line.chomp
        word_signature = signature_of(word)
        anagram_signature = signature_of(anagram)
        result << anagram if word_signature==anagram_signature
      end
      result
    end
   
  end
end
