# How would you define a Person class or struct so that any Person can be assigned as the parent of another Person?
# And that the following relations between people are present?
# bob = Person.new
# mary = Person.new(name: "Mary", parent: bob)
# fred = Person.new(name: "Fred", parent: bob)
# Secondary Questions:
# How would you create a grandchildren relation.
# How would this work with multiple parents.
# How would this work with N descendants.
# person.descendants(level: 1) => # children
# person.descendants(level: 2) => # grandchildren
# person.descendants(levelL: 3) => # greatgrandchildren

class Person
  attr_accessor :name, :parent, :children#, :siblings

  def initialize(options={})
    @name = options[:name]
    @parent = options[:parent]
    @children = []
    update_children
  end

  # bob.children
  # [mary, fred]
  def update_children
    if self.parent
      parent.children << self
    end
  end

  # mary.siblings
  # [fred]
  def siblings
    siblings = []
    if self.parent && self.parent.children
      self.parent.children.each do |c|
        if c != self.name
          siblings << c
        end
      end
    end
    siblings
  end

  def grandchildren
    grandchildren = []
    if self.children
      self.children.each do |c|
        if c.children
          c.children.each do |g|
            grandchildren << g
          end
        end
      end
    end
    grandchildren
  end
end
