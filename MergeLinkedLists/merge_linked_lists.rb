class LinkedList
  attr_accessor :node, :next

  def initialize(node=nil)
    @node = node
  end

  def delete
    if self.next && self.next.next
      next_next = self.next.next
      self.node = self.next.node
      self.next = next_next
    elsif self.next
      self.node = self.next.node
      self.next = nil
    else
      self.node = nil
      self.next = nil
    end
    self
  end
end

class MergedList
  def merge(list1, list2, merged_list)
    while list1.node || list2.node do
      if (list2.node.nil? && list1.node) || ((list1.node < list2.node) if list1.node && list2.node)
        merged_list.node = list1.node
        list1 = list1.delete
      elsif (list1.node.nil? && list2.node) || ((list1.node > list2.node) if list1.node && list2.node)
        merged_list.node = list2.node
        list2 = list2.delete
      end
      merged_list.next = LinkedList.new
      merge(list1, list2, merged_list.next)
    end
    return merged_list
  end
end

list1 = LinkedList.new(1)
list1.next = LinkedList.new(4)
list1.next.next = LinkedList.new(7)
list2 = LinkedList.new(2)
list2.next = LinkedList.new(3)
list2.next.next = LinkedList.new(8)
merged_list = LinkedList.new()
merged_list = MergedList.new.merge(list1, list2, merged_list)
merged_list.node == 1
merged_list.next.node == 2
merged_list.next.next.node == 3
merged_list.next.next.next.node == 4
merged_list.next.next.next.next.node == 7
merged_list.next.next.next.next.next.node == 8
