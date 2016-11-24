class DictionarySearch
  def initialize(file_path)
    @dictionary = {}
    @word_pairs = []

    File.open(file_path, 'r') do |f|
      f.each_line do |line|
        line.chomp!
        next if line[-1] == line[-2] || line.size < 3
        key = line[0..-3]
        @dictionary[key] ||= []
        @dictionary[key] << line[-2..-1]
      end
    end

    @dictionary.delete_if { |_k, v| v.size == 1 }
  end

  def word_pairs
    @dictionary.each_pair do |k, v|
      v.each do |e1|
        v.each do |e2|
          if e1 == e2.to_s.reverse
            @word_pairs << [k + e1, k + e2]
            v.delete(e2)
          end
        end
      end
    end

    @word_pairs
  end
end
