class BinarySearchTree
  def self.lowest_common_ancestor(node1, node2)
    if node1.parent == node2 || node1.parent == node2.parent
      return node1.parent.root
    elsif node2.parent == node1
      return node2.parent.root
    else
      return lowest_common_ancestor(node1.parent, node2.parent)
    end
  end
end

class Node
  attr_accessor :root, :left, :right, :parent

  def initialize(root)
    @root = root
    @left = nil
    @right = nil
  end

  def add_item(item)
    if item < root || item == root
      if self.left
        left.add_item(item)
      else
        @left = Node.new(item)
        @left.parent = self
      end
    else
      if self.right
        right.add_item(item)
      else
        @right = Node.new(item)
        @right.parent = self
      end
    end
  end
end

root = Node.new(20)
root.add_item(8)
root.add_item(22)
root.add_item(4)
root.add_item(12)
root.add_item(10)
root.add_item(14)
root.root == 20
root.left.root == 8
root.right.root == 22
root.left.left.root == 4
root.left.right.root == 12
root.left.right.left.root == 10
root.left.right.right.root == 14
# LCA(4, 8) => 8
BinarySearchTree.lowest_common_ancestor(root.left.left, root.left) == 8
# LCA(10, 14) => 12
BinarySearchTree.lowest_common_ancestor(root.left.right.left, root.left.right.right) == 12
# LCA(12, 22) => 20
BinarySearchTree.lowest_common_ancestor(root.left.right, root.right) == 20
