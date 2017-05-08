require_relative 'piece'

class Pawn < Piece

  ATTACK_DIRS = {
    'white' => [Piece::DIR[:UL], Piece::DIR[:UR]],
    'black' => [Piece::DIR[:DL], Piece::DIR[:DR]]
  }

  MOVE_DIR = {
    'white' => Piece::DIR[:U],
    'black' => Piece::DIR[:D]
  }

  START_LINE = {
    'white' => 2,
    'black' => 7
  }

  def to_s
    @player.color == 'white' ? "\u2659" : "\u265F"
  end

  def update_available_moves
    @available_moves = available_attack_moves + available_move_moves
  end

########################################################################################################################
  private

  def available_attack_moves
    moves = Pawn::ATTACK_DIRS[@player.color].map do |dir|
      @location.map.with_index { |coord, idx| coord + dir[idx] }
    end

    moves.select do |move|
      @board.has_space?(move) && !@board[*move].nil? && @board[*move].player != @player
    end
  end

  def available_move_moves
    moves = []

    one_space = @location.map.with_index { |coord, idx| coord + Pawn::MOVE_DIR[@player.color][idx] }
    if @board.has_space?(one_space) && @board[*one_space].nil?
      moves << one_space

      if on_start_line?
        second_space = one_space.map.with_index { |coord, idx| coord + Pawn::MOVE_DIR[@player.color][idx] }
        if @board.has_space?(second_space) && @board[*second_space].nil?
          moves << second_space
        end
      end
    end

    moves
  end

  def on_start_line?
    @location[1] == Pawn::START_LINE[@player.color]
  end
end
