# Define a Queue class using 2 stacks
# Implement push and pop operations
class NewQueue
  attr_accessor :stack_one, :stack_two

  def initialize
    @stack_one = Array.new
    @stack_two = Array.new
  end

  # add an item to the end of the queue
  def push(item)
    stack_one << item
  end

  # remove the first item in the list and return it
  def pop
    while !stack_one.empty?
      item = stack_one.pop
      if stack_one.length >= 1
        stack_two << item
      end
    end
    while !stack_two.empty?
      new_item = stack_two.pop
      stack_one << new_item
    end
    item
  end
end

queue = NewQueue.new
queue.push(1)
queue.push(2)
queue.push(3)
queue.pop == 1
queue.pop == 2
queue.pop == 3
queue.pop == nil
