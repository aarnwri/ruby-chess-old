require_relative 'pieces/pieces'
require_relative 'move'

class Player

  attr_reader :name, :color

  def initialize (game:, name:, color:)
    puts "create player"

    @game = game
    @name = name
    @color = color

    @pieces = initialize_pieces
  end

  def move_available?
    @pieces.any? { |p| !p.available_moves.empty? }
  end

  def in_check?
    # TODO: finish this
    false
  end

  def take_turn
    # TODO: finish this
    puts ""
    puts @game.board.to_s

    move = Move.new(game: @game, player: self)

    until move.valid?
      # TODO: we should print the actual reason for the failure
      puts "That move is invalid..."
      puts "Please try another..."

      puts ""
      puts @game.board.to_s

      move = Move.new(game: @game, player: self)
    end

    move.perform
  end

########################################################################################################################
  private

  def initialize_pieces
    pieces = []

    # add backrow pieces to board
    y_val = (@color.to_s == 'white' ? 1 : 8)
    @game.board[5, y_val] = King.new(game: @game, player: self, location: [5, y_val])
    @game.board[4, y_val] = Queen.new(game: @game, player: self, location: [4, y_val])
    [1, 8].each { |x_val| @game.board[x_val, y_val] = Rook.new(game: @game, player: self, location: [x_val, y_val]) }
    [2, 7].each { |x_val| @game.board[x_val, y_val] = Knight.new(game: @game, player: self, location: [x_val, y_val]) }
    [3, 6].each { |x_val| @game.board[x_val, y_val] = Bishop.new(game: @game, player: self, location: [x_val, y_val]) }

    # add backrow pieces to self
    (1..8).each { |col| pieces << @game.board[col, y_val] }

    # add pawns to board
    y_val = (@color.to_s == 'white' ? 2 : 7)
    (1..8).each { |x_val| @game.board[x_val, y_val] = Pawn.new(game: @game, player: self, location: [x_val, y_val]) }

    # add pawns to self
    (1..8).each { |col| pieces << @game.board[col, y_val] }

    pieces
  end

end
