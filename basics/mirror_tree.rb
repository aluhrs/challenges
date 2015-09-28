class MirrorTree
  attr_accessor :current_root

  def initialize(value)
    @current_root = Node.new(value, nil, nil)
  end

  def add(item)
    puts "tree root: #{current_root.root}"
    puts "tree left: #{current_root.left}"
    puts "tree right: #{current_root.right}"
    if empty_root?
      current_root.root = item
    elsif !empty_root? && !empty_left? && !empty_right?
      current_root = make_new_current_root
      puts "current after method: #{current_root.inspect}"
      add(item)
    elsif !empty_root? && !empty_left?
      current_root.right = item
    elsif !empty_root?
      current_root.left = item
    else
      return
    end
  end

  def make_new_current_root
    left = current_root.left
    Node.new(left, nil, nil)
  end

  def empty_root?
    current_root.root.nil?
  end

  def empty_left?
    current_root.left.nil?
  end

  def empty_right?
    current_root.right.nil?
  end
end

class Node
  attr_accessor :root, :left, :right

  def initialize(root, left, right)
    @root = root
    @left = left
    @right = right
  end
end

# puts "empty_root?: #{current_root.root.nil?}"
# puts "empty_left?: #{current_root.left.nil?}"
# puts "empty_right?: #{current_root.right.nil?}"
tree = MirrorTree.new("1")
tree.add("2")
tree.add("2")
tree.add("3")
