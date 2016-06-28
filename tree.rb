class Node
  attr :value
  attr :parent
  attr :childs

  def initialize(value, parent = nil, left_child = nil, right_child = nil)
    @value = value
    @parent = parent
    @childs = {left:left_child, right:right_child}
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
  puts array.size
  
  if array.size == 1
    name_node = array[1]
    left_arr = array[0]
    right_arr = nil
    $tree << Node.new(name_node)
  end

  if array.size > 1
      name_node = array[array.size/2]
      left_arr = build_tree(array.slice(0,array.size/2 - 1))
      right_arr = build_tree(array.slice(array.size/2 + 1, array.size))
      $tree << Node.new(name_node)
  end

end

#------
$tree = []
build_tree([1,2,3,4,6,7,8,9,10])
print $tree
puts
