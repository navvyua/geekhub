# This class searching a word pairs whereby swapping
# the last two letters of the word results in another
# valid word.
# Examples: [coal, cola], [minute, minuet]
class DictionarySearch
  def initialize(file_path)
    @dictionary = {}
    @word_pairs = []

    File.open(file_path, 'r') do |f|
      f.each_line do |line|
        line.chomp!
        next if line[-1] == line[-2] || line.size < 3
        add_word_to_dictionary(line)
      end
    end

    @dictionary.delete_if { |_k, v| v.size == 1 }
  end

  def word_pairs
    @dictionary.each_pair do |k, v|
      v.each do |e1|
        v.each { |e2| compare_words(e1, e2, k, v) }
      end
    end

    @word_pairs
  end

  private

  def add_word_to_dictionary(line)
    key = line[0..-3]
    @dictionary[key] ||= []
    @dictionary[key] << line[-2..-1]
  end

  def compare_words(element1, element2, key, value)
    return unless element1 == element2.to_s.reverse
    @word_pairs << [key + element1, key + element2]
    value.delete(element2)
  end
end
