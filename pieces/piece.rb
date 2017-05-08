class Piece

  DIR = {
    U: [0, 1],
    UR: [1, 1],
    R: [1, 0],
    DR: [1, -1],
    D: [0, -1],
    DL: [-1, -1],
    L: [-1, 0],
    UL: [-1, 1]
  }

  attr_accessor :location

  attr_reader :player

  # NOTE: available_moves are locations accessible to the piece,
  # whereas valid_moves are available_moves that will not put the player in check.
  attr_reader :available_moves
  # attr_reader :valid_moves # TODO: we don't want to store this... we will validate as needed

  def initialize (game:, player:, location:)
    @game = game
    @player = player
    @location = location

    @available_moves = update_available_moves
  end

  def location= (location)
    raise "not a valid location" unless @available_moves.include?(location)
    @location = location
    update_available_moves
  end

  def valid_moves
    @available_moves.each do |move|
      # TODO: finish this...
      # dupe the board, make the move, and check to see if the opponent is in check... if not, it's valid
      # NOTE: since Move requires the game instance, we need to dupe the game, the players, and everything...
      duplicated_game = @game.duplicate
    end
  end

########################################################################################################################
  private

  def update_available_moves
    # ABSTRACT METHOD: implementation will vary between different types of pieces
    raise "update_available_moves not implemented for the #{self.class} class"
  end
end

# class Piece
#
#   DIR = {
#     U: [0, 1],
#     UR: [1, 1],
#     R: [1, 0],
#     DR: [1, -1],
#     D: [0, -1],
#     DL: [-1, -1],
#     L: [-1, 0],
#     UL: [-1, 1]
#   }
#
#   attr_reader :player
#
#   attr_accessor :location
#
#   def initialize (player, board, location)
#     @player = player
#     @board = board
#     @location = location
#   end
#
#   def to_s
#     # ABSTRACT METHOD
#     raise "to_s method not implemented on #{self.class} class"
#   end
#
#   def allowed_moves
#     # ABSTRACT METHOD
#     raise "allowed_moves method not implemented on #{self.class} class"
#   end
#
#   def check_position (position)
#     puts "position: #{position}"
#     puts "@board.has_space?: #{@board.has_space?(position)}"
#     @board.has_space?(position) && (@board[*position].nil? || @board[*position].player != @player)
#   end
# end
