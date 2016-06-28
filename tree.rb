class Node
  attr :value
  attr :parent
  attr :childs

  def initialize(value)
    @value = value
    @parent = nil
    @childs = {left:nil, right:nil}
  end

  def get_parent
    @parent
  end

  def set_parent=(value)
    @parent = value
  end

  def get_left_child
    @childs[:left]
  end

  def set_left_child=(value)
    @childs[:left] = value
  end

  def get_right_child
    @childs[:right]
  end

  def set_right_child=(value)
    @childs[:right] = value
  end


end

def build_tree(array)

end

#------

test = Node.new(8)
test.set_parent=10
test.set_right_child= 5
puts test.get_right_child
