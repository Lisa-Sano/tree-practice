class TreeNode
   attr_accessor :value, :left, :right

   def initialize(val)
     @value = val
     @left = nil
     @right = nil
   end
end

def print_infix(node)
  return if node == nil
  print_infix(node.left)
  print node.value + " "
  print_infix(node.right)
end

def print_prefix(node)
  return if node == nil
  print node.value + " "
  print_prefix(node.left)
  print_prefix(node.right)
end

def print_postfix(node)
  return if node == nil
  print_postfix(node.left)
  print_postfix(node.right)
  print node.value + " "
end

def operators(node)
  return if node == nil
  operators(node.left)
  print node.value + " " unless node.left.nil? && node.right.nil?
  operators(node.right)
end

# method that returns the count of non-operators (in this case, leaves)
def leaves(node)
  return 1 if node.left.nil? && node.right.nil?
  leaves(node.left) + leaves(node.right)
end

# method that returns whether a given operator exists in the tree
def includes_op(node, op)
  return true if node.value == op
  if !node.left.nil? && !node.right.nil?
    includes_op(node.left, op) || includes_op(node.right, op)
  else
    return false
  end
end


################################################
# print all the things
root = TreeNode.new("-")
root.right = TreeNode.new("10")
root.left = TreeNode.new("+")
root.left.left = TreeNode.new("20")
root.left.right = TreeNode.new("2")
puts "Tree 1"
puts "infix:"
puts print_infix(root)
puts "operators:"
puts operators(root)
puts "leaves:"
puts leaves(root)
puts "prefix:"
puts print_prefix(root)
puts "postfix:"
puts print_postfix(root)
puts "includes operator '+'?"
puts includes_op(root, '+')
puts "includes operator '/'?"
puts includes_op(root, '/')
puts("*" * 30)

root2 = TreeNode.new("+")
root2.left = TreeNode.new("-")
root2.left.left = TreeNode.new("/")
root2.left.left.left = TreeNode.new("10")
root2.left.right = TreeNode.new("3")
root2.left.left.right = TreeNode.new("2")
root2.right = TreeNode.new("*")
root2.right.left = TreeNode.new("+")
root2.right.left.left = TreeNode.new("7")
root2.right.left.right = TreeNode.new("1")
root2.right.right = TreeNode.new("5")
puts "Tree 2"
puts "infix:"
puts print_infix(root2)
puts "operators:"
puts operators(root2)
puts "leaves:"
puts leaves(root2)
puts "prefix:"
puts print_prefix(root2)
puts "postfix:"
puts print_postfix(root2)
puts "includes operator '+'?"
puts includes_op(root2, '+')
puts "includes operator '%'?"
puts includes_op(root2, '%')
puts("*" * 30)

root3 = TreeNode.new("-")
root3.right = TreeNode.new("%")
root3.right.right = TreeNode.new("5")
root3.right.left = TreeNode.new("10")
root3.left = TreeNode.new("+")
root3.left.left = TreeNode.new("*")
root3.left.right = TreeNode.new("2")
root3.left.left.left = TreeNode.new("4")
root3.left.left.right = TreeNode.new("3")
puts "Tree 3"
puts "infix:"
puts print_infix(root3)
puts "operators:"
puts operators(root3)
puts "leaves:"
puts leaves(root3)
puts "prefix:"
puts print_prefix(root3)
puts "postfix:"
puts print_postfix(root3)
puts "includes operator '+'?"
puts includes_op(root3, '+')
puts "includes operator '/'?"
puts includes_op(root3, '/')

