require_relative 'PolyTreeNode'
require 'byebug'
class KnightPathFinder
    attr_reader :current_pos
    def initialize(pos)
        @current_pos = pos
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
        @moves = {}
    end

    def self.valid_moves(pos)
        # debugger
        x,y = pos
        moves = []
        [[1,2],[2,1]].each do |offsets| 
            [offsets[0],-offsets[0]].each do |x_offset|
                [offsets[1],-offsets[1]].each do |y_offset|
                    moves << [x + x_offset,y + y_offset] if (x + x_offset).between?(0,7) && (y + y_offset).between?(0,7)
                end
            end
        end
        moves
    end

    def new_move_positions(pos)
        # debugger
        possible_moves = KnightPathFinder.valid_moves(pos)
        new_moves = possible_moves.select { |move| !@considered_positions.include?(move) }
        @considered_positions.concat(new_moves)
        return new_moves
    end

    def build_move_tree
        # debugger
        new_moves = new_move_positions(@current_pos)
        new_moves.each do |move|
            @moves[move] = @root_node
        end

        until new_moves.empty? do
            current_move = PolyTreeNode.new(new_moves.shift)
            current_move.parent = @moves[current_move.value]
            next_moves = new_move_positions(current_move.value)

            next_moves.each { |move| @moves[move] = current_move }
            new_moves.concat(next_moves)
        end
        @root_node
    end

end

x = KnightPathFinder.new([0,0])
p x.build_move_tree
# p KnightPathFinder.valid_moves([0,0])