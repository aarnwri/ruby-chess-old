require_relative 'piece'

class Knight < Piece

  def to_s
    @player.color == 'white' ? "\u2658" : "\u265E"
  end

  def update_available_moves
    # TODO: finish this
    @available_moves = []
  end
end

# class Knight < Piece
#
#   DIR = {
#     UR: [1, 2],
#     RU: [2, 1],
#     RD: [2, -1],
#     DR: [1, -2],
#     DL: [-1, -2],
#     LD: [-2, -1],
#     LU: [-2, 1],
#     UL: [-1, 2]
#   }
#
#   def to_s
#     @player.color == 'white' ? "\u2658" : "\u265E"
#   end
#
#   def allowed_moves
#     moves = []
#
#     Knight::DIR.values.each do |dir|
#       new_pos = @location.map.with_index { |coord, idx| coord + dir[idx] }
#
#       moves << new_pos if check_position(new_pos)
#     end
#
#     moves
#   end
# end
