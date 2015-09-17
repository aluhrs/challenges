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
# person.descendants(level: 3) => # greatgrandchildren

class Person
  attr_accessor :name, :parent, :children

  # expect parent to come in as an array
  # ex: Person.new(name: "Mary", parent: [bob])
  def initialize(options={})
    @name = options[:name]
    @parent = options[:parent]
    @children = []
    update_children
  end

  # bob.children
  # [mary, fred]
  def update_children
    if parent
      parent.each do |p|
        p.children << self
      end
    end
  end

  # mary.siblings
  # [fred]
  def siblings
    siblings = []
    if parent
      parent.each do |p|
        if p.children
          p.children.each do |c|
            if c != self
              siblings << c
            end
          end
        end
      end
    end
    siblings
  end

  # bob.grandchildren
  # [gkid]
  def grandchildren
    grandchildren = []
    if children
      children.each do |c|
        if c.children
          c.children.each do |g|
            grandchildren << g
          end
        end
      end
    end
    grandchildren
  end

  # Is just printing the descendants sufficient?
  # If this is good, I would replace the contents 
  # of the grandchildren method with just a 
  # call to descdendants(level: 2)
  def descendants(level: 0)
    return if children.empty? || level <= 0
    children.each do |c|
      puts "child: #{c.inspect}"
      c.descendants(level: level - 1)
    end
  end
end
