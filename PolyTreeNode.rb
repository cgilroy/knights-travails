require 'byebug'
class PolyTreeNode
    attr_reader :value, :parent, :children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        @parent.children.delete(self) unless @parent == nil
        @parent = node
        node.children << self unless node == nil
    end

    def add_child(node)
        if node.parent != self
            node.parent = self
        end
        self
    end

    def remove_child(node)
        raise if !@children.include?(node)
        node.parent = nil
        @children.delete(node)
    end

    def dfs(target_value)
        # debugger
        return self if target_value == self.value
        self.children.each do |child|
            search_res = child.dfs(target_value)
            return search_res if search_res
        end
        nil
    end

    def bfs(target_value)
        queue = [self]
        until queue.empty? do
            node = queue.shift
            return node if node.value == target_value
            node.children.each { |child| queue << child }
        end
        nil
    end

end


# nodes = ('a'..'g').map { |value| PolyTreeNode.new(value) }

# debugger
# parent_index = 0
# nodes.each_with_index do |child, index|
#     next if index.zero?
#     child.parent = nodes[parent_index]
#     parent_index += 1 if index.even?
# end

# x = 2
# node1 = PolyTreeNode.new('a')
# node2 = PolyTreeNode.new('b')
# node3 = PolyTreeNode.new('c')
# node4 = PolyTreeNode.new('d')
# node5 = PolyTreeNode.new('e')

# node2.parent = node1
# node3.parent = node1
# node4.parent = node2
# node5.parent = node2

# x = node1.dfs("e")

# debugger