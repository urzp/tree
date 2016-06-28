class Node
  attr_accessor :value, :parent, :childs


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

def build_tree(array, parent = nil, derection = nil, tree = [])
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
    tree << Node.new(name_node, parent, left_child, right_child)
  end
  
  if array.size == 3
    name_node = array[1]
    left_child = array[0]
    right_child = array[2]
    tree << Node.new(name_node, parent, left_child, right_child)
  end

  if array.size > 3
    name_node = array[array.size/2]
	left = array.slice(0,array.size/2)
	right = array.slice(array.size/2 + 1, array.size)
	left_child = left[left.size/2]
	right_child = right[right.size/2]
	tree << Node.new(name_node, parent, left_child, right_child)

    build_tree(left, name_node, :left, tree)  
    build_tree(right, name_node, :right, tree)
  end    
  
  return tree
end

#------

tree = build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
puts
puts "*************************************************************"
puts
tree.each do |i|
  print "parent=#{i.parent} val=#{i.value} chlds #{i.childs} "
  puts
end
