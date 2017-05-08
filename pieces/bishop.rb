require_relative 'piece'

class Bishop < Piece

  def to_s
    @player.color == 'white' ? "\u2657" : "\u265D"
  end

  def update_available_moves
    # TODO: finish this
    @available_moves = []
  end
end

# class Bishop < Piece
#
#   def to_s
#     @player.color == 'white' ? "\u2657" : "\u265D"
#   end
#
#   def allowed_moves
#     moves = []
#
#     current_pos = @location
#     [Piece::DIR[:UR], Piece::DIR[:DR], Piece::DIR[:DL], Piece::DIR[:UL]].each do |dir|
#       new_pos = current_pos.map.with_index { |coord, idx| coord + dir[idx] }
#       until !@board.has_space?(new_pos) || !@board[*new_pos].nil?
#         moves << new_pos
#         new_pos = new_pos.map.with_index { |coord, idx| coord + dir[idx] }
#       end
#
#       if @board.has_space?(new_pos) && @board[*new_pos].player != @player
#         moves << new_pos
#       end
#     end
#
#     moves
#   end
# end
