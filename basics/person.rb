# First Pass. I feel like there could be a better way to do this than a class variable?

# How would you define a Person class or struct so that any Person can be assigned as the parent of another Person?
# And that the following relations between people are present?
# bob = Person.new
# mary = Person.new(name: "Mary", parent: bob)
# fred = Person.new(name: "Fred", parent: bob)

class Person
  attr_accessor :name, :parent, :children, :siblings
  @@all = []

  def self.all
    @@all
  end

  def initialize(options={})
    @name = options[:name]
    @parent = options[:parent]
    @@all << self
  end

  # bob.children
  # [mary, fred]
  def children
    children = []
    Person.all.each do |p|
      if p.parent && p.parent == self
        children << p.name
      end
    end
    children
  end

  # mary.siblings
  # [fred]
  def siblings
    siblings = []
    Person.all.each do |p|
      if p != self
        if self.parent && p.parent
          if p.parent == self.parent
            siblings << p.name
          end
        end
      end
    end
    siblings
  end
end
