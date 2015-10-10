class LinkedList
  attr_accessor :node, :next

  def initialize(node=nil)
    @node = node
  end

  def self.merge(l1, l2)
    # if either list is empty, return the other list
    return l1 unless l2
    return l2 unless l1

    if l1.node < l2.node
      l1.next = merge(l1.next, l2)
      return l1
    else
      l2.next = merge(l1, l2.next)
      return l2
    end
  end
end

list1 = LinkedList.new(1)
list1.next = LinkedList.new(4)
list1.next.next = LinkedList.new(7)
list2 = LinkedList.new(2)
list2.next = LinkedList.new(3)
list2.next.next = LinkedList.new(8)
merged_list = LinkedList.merge(list1, list2)
merged_list.node == 1
merged_list.next.node == 2
merged_list.next.next.node == 3
merged_list.next.next.next.node == 4
merged_list.next.next.next.next.node == 7
merged_list.next.next.next.next.next.node == 8
