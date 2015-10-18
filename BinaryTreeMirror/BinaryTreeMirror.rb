class BinaryTree
  def mirror?(left, right)
    if left.nil? && right.nil?
      return true
    elsif left.root == right.root
      if (left.left && right.right.nil?) || (left.right && right.left.nil?)
        return false
      end
      mirror?(left.left, right.right) && mirror?(left.right, right.left)
    end
  end
end

class Node
  attr_accessor :root, :left, :right

  def initialize(root)
    @root = root
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

root = Node.new(1)
left_root = root.add_left(2)
right_root = root.add_right(2)
left_root.add_left(3)
left_root.add_right(4)
right_root.add_left(4)
right_root.add_right(3)
BinarySearchTree.new.mirror?(left_root, right_root) == true
