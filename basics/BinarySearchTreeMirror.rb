class BinarySearchTreeMirror
  def mirror?(root_left, root_right)
    if root_left.nil? && root_right.nil?
      return true
    elsif root_left.root == root_right.root
      if (root_left.left && root_right.right.nil?) || (root_left.left.nil? && root_right.right)
        return false
      elsif (root_left.right && root_right.left.nil?) || (root_left.right.nil? && root_right.left)
        return false
      end
      mirror?(root_left.left, root_right.right) && mirror?(root_left.right, root_right.left)
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

left_root = Node.new(1)
left_left = left_root.add_left(2)
left_left.add_left(3)
left_left.add_right(4)
right_root = Node.new(1)
right_right = right_root.add_right(2)
right_right.add_left(4)
right_right.add_right(3)
BinarySearchTreeMirror.new.mirror?(left_root, right_root) == true
