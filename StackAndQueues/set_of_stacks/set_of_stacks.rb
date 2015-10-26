class SetOfStacks
  attr_accessor :stacks, :last_stack

  MAXIMUM_THRESHOLD = 2

  def initialize
    @stacks = Array.new
    @stack = Array.new
    @stacks << @stack
    @last_stack = @stack
  end

  def push(item)
    if @last_stack.length >= MAXIMUM_THRESHOLD
      new_stack = Array.new
      new_stack.push(item)
      @stacks << new_stack
      @last_stack = new_stack
    else
      @last_stack << item
    end
  end

  def pop
    @last_stack.pop
  end

  def pop_at(stack_index)
    pop_stack = @stacks[stack_index]
    pop_stack.pop
  end
end

sos = SetOfStacks.new
sos.push(1)
sos.push(2)
puts sos.pop == 2
sos.push(3)
sos.push(4)
puts sos.pop == 4
sos.push(5)
sos.push(6)
sos.push(7)
puts sos.pop_at(2) == 7
