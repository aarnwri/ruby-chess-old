require_relative 'piece'

class King < Piece

  def to_s
    @player.color == 'white' ? "\u2654" : "\u265A"
  end

  def update_available_moves
    # TODO: finish this
    @available_moves = []
  end
end

# class King < Piece
#
#   def initialize (player, board, location, game)
#     super(player, board, location)
#
#     @game = game
#   end
#
#   def to_s
#     @player.color == 'white' ? "\u2654" : "\u265A"
#   end
#
#   def allowed_moves
#     # TODO: finish this
#     moves = []
#
#     Piece::DIR.values.each do |dir|
#       new_pos = @location.map.with_index { |coord, idx| coord + dir[idx] }
#
#       if @game.current_player != @player
#         moves << new_pos if check_position(new_pos)
#       else
#         moves << new_pos if check_position(new_pos) && !in_check?(new_pos)
#       end
#     end
#
#     moves
#   end
#
#   def in_check? (pos = @location)
#     opposing_pieces = @game.players.select { |p| p != @player }.first.pieces
#
#     opposing_pieces.each do |piece|
#       return true if piece.allowed_moves.include?(pos)
#     end
#
#     false
#   end
# end
