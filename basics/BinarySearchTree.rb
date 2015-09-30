class BinarySearchTree
  attr_accessor: :left, :root, :right
  def initialize(left, root, right)
    @left = left
    @root = root
    @right = right
  end

  def equal?(left_tree, root, right_tree)
    if left_tree.length != right_tree.length
      puts "is this false? #{left_tree.length != right_tree.length}"
      false
    elsif left_tree.length == 1 && right_tree.length == 1
      puts "is this false? #{left_tree.length == 1 && right_tree.length == 1}"
      left_tree == right_tree
    elsif left_tree.length > 1 && right_tree.length > 1
      puts "is this false? #{left_tree.length > 1 && right_tree.length > 1}"
      left_tree.each do |lt_node|
        right_tree.each do |rt_node|
          puts "lt #{lt_node}"
          puts "rt #{rt_node}"
          if lt_node == rt_node
            true
          else
            false
          end
        end
      end

    end
  end

  # def equal?(left_tree, node, right_tree)
  #   unless left_tree[0].nil?
  #     puts "left_tree[0]: #{left_tree[0]}"
  #     if right_tree[-1]
  #       puts "right_tree[0]: #{right_tree[0]}"
  #       if left_tree[0] == right_tree[-1]
  #         if left_tree[1] && right_tree[-1]
  #           puts "LT[1]: #{left_tree[1]}"
  #           puts "RT[1]: #{right_tree[1]}"
  #           equal?(left_tree[1], nil, right_tree[-1])
  #         else
  #           false
  #         end
  #       elsif left_tree[1].nil?
  #         false
  #       elsif right_tree[1].nil?
  #         false
  #       else
  #         true
  #       end
  #     else
  #       true
  #     end
  #   end
  # end
end

BinarySearchTree.new.equal?([[2], [3, 4]], 1, [[2], [4, 3]]) == true
