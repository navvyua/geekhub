# dasdsa
class Polynomial
  def initialize(elements = [])
    raise ArgumentError, 'Two or more coefficients are required' if elements.size < 2

    last_zero = elements.last.zero?
    elements.reject!(&:zero?)
    return if elements.empty?

    @polynomial = []
    elements.each_with_index do |e, i|
      last = (i + 1) == elements.size ? true : false

      if e.negative?
        @polynomial << '-'
      else
        @polynomial << '+' unless i.zero?
      end

      @polynomial << e.abs.to_s unless e.abs == 1 && !last
      @polynomial << "x^#{elements.size - i}" unless last
    end
    @polynomial << 'x' if last_zero
    @polynomial = @polynomial.join
  end

  def to_s
    @polynomial ||= 0.to_s
  end
end
