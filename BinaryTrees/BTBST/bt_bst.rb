def bst(root, min=nil, max=nil)
  if (root.data < min if min) || (root.data > max if max)
    return false
  end

  if root.left
    if !bst(root.left, min, root.data)
      return false
    end
  end

  if root.right
    if !bst(root.right, root.data, max)
      return false
    end
  end
  true
end

class Node
  attr_accessor :data, :left, :right

  def initialize(root)
    @data = root
    @left = nil
    @right = nil
  end

  def add_left(item)
    self.left = Node.new(item)
  end

  def add_right(item)
    self.right = Node.new(item)
  end
end

root = Node.new(7)
left_root = root.add_left(5)
right_root = root.add_right(9)
left_root.add_left(4)
left_root.add_right(6)
right_root.add_left(8)
right_root.add_right(10)
puts bst(root) == true

root = Node.new(7)
left_root = root.add_left(5)
right_root = root.add_right(9)
left_root.add_left(4)
left_root.add_right(11)
right_root.add_left(8)
right_root.add_right(10)
puts bst(root) == false
