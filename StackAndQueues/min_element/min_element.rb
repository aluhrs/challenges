# stack, in addition to push/pop, has function min returns min element - all should be in O(1) time
# last in, first out

class Stack
  attr_accessor :stack, :min_element

  def initialize
    @stack = []
  end

  def push(item)
    stack << item
    determine_min(item)
  end

  def pop
    stack.pop
  end

  def determine_min(item)
    if @min_element
      @min_element = item if @min_element > item
    else
      @min_element = item
    end
  end

  def min
    @min_element
  end
end

s = Stack.new
puts "stack: #{s.inspect}"
s.push(5)
s.push(3)
s.push(4)
puts "stack: #{s.inspect}"
puts s.pop == 4
s.push(4)
puts "stack: #{s.inspect}"
puts s.min == 3
