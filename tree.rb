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
  #print "#{array} size=#{array.size}  parent=#{parent} dir=#{derection}"
  #puts
  
  if array.size == 2
    if derection == :left or derection == nil
      name_node = array[1]
      left_child = Node.new(array[0], name_node)
      right_child = nil
	else
	  name_node = array[0]
      left_child = nil
      right_child = Node.new(array[1], name_node)	  
	end
    node = Node.new(name_node, parent, left_child, right_child)
	$tree = node
	$tree << left_child unless left_child == nil
	$tree << left_child unless right_child == nil
	return node
  end
  
  if array.size == 3
    name_node = array[1]
    left_child = Node.new(array[0], name_node) 
    right_child = Node.new(array[2], name_node)
    node = Node.new(name_node, parent, left_child, right_child)
	$tree << node
	$tree << left_child
	$tree << right_child
	return node
  end

  if array.size > 3
    name_node = array[array.size/2]
	left = array.slice(0,array.size/2)
	right = array.slice(array.size/2 + 1, array.size)
	left_child = build_tree(left, name_node, :left, tree)
	right_child = build_tree(right, name_node, :right, tree)
	node = Node.new(name_node, parent, left_child , right_child )  
    $tree << node	
	return node
  end    
  
  
end

def found?(value, node)
    return node if value == node.value
	return node.childs[:left] if node.childs[:left] != nil and node.childs[:left].value == value
	return node.childs[:right] if node.childs[:right] != nil and node.childs[:right].value == value
	return false
end  


def breadth_first_search(tree, value)
  visited = []
  tree.each do |node|
    unless visited.any?{|i| i == node or i == node.get_left_child or i = node.get_right_child }
      return found?(value, node) if found?(value, node)
	  visited << node
	end  
  end
  return nil
  
end

def depth_first_search(tree, root, value)
  visited = {node: [], found: nil}
  current = root
  visited[:node] << current
  
  visit_node(current, visited, value)
  return visited[:found]
end

def visit_node(current, visited, value)
  if  visited[:found] == nil
    if value == current.value 
	  visited[:found] = current
	end
    
  current.childs.each do |name, child|
      if visited.any?{|i| i != child} and child != nil
        visited[:node] << child
		print "Parent=#{child.parent}  \t  node=#{child.value}" 
		puts
        visit_node(child, visited, value) 
	  end
  end
 end
end



def view_tree(tree)
  puts "*************************************************************"
  puts
  
  tree.each do |i|
    print "parent=#{i.parent} \t val=#{i.value}  \t chld   left=#{i.childs[:left].value unless i.childs[:left] == nil}    \t  right=#{i.childs[:right].value unless i.childs[:right] == nil}  "
    puts
  end
end


#------
$tree = []

tree = build_tree([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15], "root")
puts
view_tree($tree)
puts
#puts breadth_first_search($tree, 15).value
found = depth_first_search($tree, $tree.last, 1)
puts found
