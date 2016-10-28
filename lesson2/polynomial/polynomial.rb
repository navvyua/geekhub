# This class can create polynomial string from array of numbers.
# For example: [-5, -2, 1, 0, 6]) => -5x^4-2x^3+x^2+6
class Polynomial
  def initialize(elements = [])
    @elements = elements

    last_zero = @elements.last.zero?
    check_number_of_coefficients
    return if check_and_reject_zero

    @polynomial = []
    @elements.each_with_index { |e, i| add_element(e, i) }

    format_polynomial(last_zero)
  end

  def to_s
    @polynomial ||= '0'
  end

  private

  def check_and_reject_zero
    @elements.reject!(&:zero?)
    @elements.empty?
  end

  def check_number_of_coefficients
    return unless @elements.size < 2
    raise ArgumentError, 'Two or more coefficients are required'
  end

  def add_sign(element, index)
    if element.negative?
      @polynomial << '-'
    else
      @polynomial << '+' unless index.zero?
    end
  end

  def add_number(element, last)
    @polynomial << element.abs.to_s unless element.abs == 1 && !last
  end

  def add_pow(last, index)
    @polynomial << "x^#{@elements.size - index}" unless last
  end

  def add_element(element, index)
    last = (index + 1) == @elements.size ? true : false

    add_sign(element, index)
    add_number(element, last)
    add_pow(last, index)
  end

  def format_polynomial(last_zero)
    @polynomial << 'x' if last_zero
    @polynomial = @polynomial.join
  end
end
