require_relative 'PolyTreeNode'
require 'byebug'
class KnightPathFinder
    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
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

    def new_move_positions(pos)
        debugger
        possible_moves = KnightPathFinder.valid_moves(pos)
        new_moves = possible_moves.select { |move| !@considered_positions.include?(move) }
        @considered_positions.concat(new_moves)
        return new_moves
    end

end

x = KnightPathFinder.new([0,0])
p x.new_move_positions([0,0])
# p KnightPathFinder.valid_moves([0,0])