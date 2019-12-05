require_relative 'PolyTreeNode'
require 'byebug'
class KnightPathFinder
    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
    end

    def self.valid_moves(pos)
        # debugger
        x,y = pos
        moves = []
        [[1,2],[2,1]].each do |offsets| 
            [offsets[0],-offsets[0]].each do |x_offset|
                [offsets[1],-offsets[1]].each do |y_offset|
                    moves << [x + x_offset,y + y_offset]
                end
            end
        end
        moves
    end

end

x = KnightPathFinder.new([0,0])
p KnightPathFinder.valid_moves([0,0])