class Node
  def initialize
    @value = {parents:[], childes:[]}
  end

  def get_parents
    @value[:parents]
  end

  def get_childs
    @value[:childes]
  end

  def set_parent=(value)
    @value[:parents] << value
  end

  def set_child=(value)
    @value[:childs] << value
  end
end

#-------------------test-------------
test = Node.new
test.set_parent= 3
puts test.get_parents
