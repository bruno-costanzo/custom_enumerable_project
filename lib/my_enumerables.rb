module Enumerable
  def my_each_with_index(index = 0)
    self.size.times do |i|
      yield self[i], i + index
    end

    self
  end

  def my_select
    arr = []
    my_each_with_index do |element, index|
      arr << element if yield(element)
    end

    arr
  end

  def my_all?
    my_each_with_index do |element, index|
      return false unless yield(element)
    end

    true
  end

  def my_any?
    my_each_with_index do |element, index|
      return true if yield(element)
    end

    false
  end

  def my_none?(&block)
    my_all? { |element| !block.call(element) }
  end

  def my_count?(&block)
    my_select { |element| block.call(element) }.size
  end

  def my_map
    my_each_with_index do |element, index|
      self[index] = yield element
    end
  end

  def my_inject(result = nil)
    my_each_with_index do |element, index|
      result = yield(result, element)
    end

    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    self.size.times do |i|
      yield self[i]
    end

    self
  end
  # Define my_each here
end
