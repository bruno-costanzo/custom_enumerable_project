module Enumerable
  def my_each_with_index(index = 0)
    self.size.times do |i|
      yield self[i], i + index
    end

    self
  end

  def my_select
    arr = []
    my_each_with_index do |element|
      arr << element if yield(element)
    end

    arr
  end

  def my_all?
    my_each_with_index do |element|
      return false unless yield(element)
    end

    true
  end

  def my_any?
    my_each_with_index do |element|
      return true if yield(element)
    end

    false
  end

  def my_none?(&block)
    my_all? { |element| !block.call(element) }
  end

  def my_count(&block)
    my_select { |element| block_given? ? block.call(element) : true }.size
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

class Array
  def my_each
    self.size.times do |i|
      yield self[i]
    end

    self
  end
end
