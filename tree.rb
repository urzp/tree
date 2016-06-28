class Node
  attr :value
  attr :parents
  attr :childs

  def initialize(value)
    @value = value
    @parents = []
    @childs = []
  end

  def get_parents
    @parents
  end

  def get_childs
    @childes
  end

  def set_parent=(value)
    @parents << value
  end

  def set_child=(value)
    @childs << value
  end
end

def build_tree(array)

end

#------

test = Node.new(8)
test.set_parent=5
test.set_parent=6
print test.parents
