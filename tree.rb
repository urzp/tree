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

def build_tree(array, parent = nil, derection = nil)
  print "#{array} size=#{array.size}  parent=#{parent} dir=#{derection}"
  puts
  
  if array.size == 2
    if derection == :left or derection == nil
      name_node = array[1]
      left_child = array[0]
      right_child = nil
	else
	  name_node = array[0]
      left_child = nil
      right_child = array[1]	  
	end
    $tree << Node.new(name_node, parent, left_child, right_child)
  end
  
  if array.size == 3
    name_node = array[1]
    left_child = array[0]
    right_child = array[2]
    $tree << Node.new(name_node, parent, left_child, right_child)
  end

  if array.size > 3
    name_node = array[array.size/2]
	left = array.slice(0,array.size/2 - 1)
	right = array.slice(array.size/2 + 1, array.size)
	left_child = left[left.size/2]
	right_child = right[right.size/2]
	$tree << Node.new(name_node, parent, left_child, right_child)

    build_tree(array.slice(0,array.size/2), name_node, :left)  
    build_tree(array.slice(array.size/2 + 1, array.size), name_node, :right)
  end    
  

end

#------
$tree = []
build_tree([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15])
print $tree
puts
