require_relative 'piece'

class Rook < Piece

  DIRS = [
    Piece::DIR[:U],
    Piece::DIR[:D],
    Piece::DIR[:L],
    Piece::DIR[:R]
  ]

  def to_s
    @player.color == 'white' ? "\u2656" : "\u265C"
  end

  def update_available_moves
    @available_moves = []

    current_location = @location
    Rook::DIRS.each do |dir|
      new_location = current_location.map.with_index { |coord, idx| coord + dir[idx] }
      until !@board.has_space?(new_location) || !@board[*new_location].nil?
        @available_moves << new_location
        new_location = new_location.map.with_index { |coord, idx| coord + dir[idx] }
      end
    end
  end
end
