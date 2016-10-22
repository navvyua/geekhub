class DictionarySearch
  def initialize(file_path)
    @words = []
    @word_pairs = []

    File.open(file_path, 'r') do |f|
      f.each_line { |line| @words << line.chomp }
    end

    @words.reject! { |word| word[-1] == word[-2] || word.size < 3 }
  end

  def word_pairs
    @words.each do |word1|
      @words.each do |word2|
        next unless word1 == word2[0..-3].to_s + word2[-2..-1].to_s.reverse
        @word_pairs << [word1, word2]
        @words.delete(word1)
        @words.delete(word2)
      end
    end

    @word_pairs
  end
end
