class Move

  def initialize (game:, player:)
    @game = game
    @player = player

    @start_space, @end_space = get_move
  end

  def valid?
    # TODO: fix this
    true
  end

  def perform
    piece = @game.board[*@start_space]
    piece.location = @end_space
    @game.board[*@end_space] = piece
    @game.board[*@start_space] = nil
  end

########################################################################################################################
  private

  def get_move
    move_parsable = false
    until move_parsable
      begin
        print "what is your move #{@player.name}? "
        move = gets.chomp
        start_space, end_space = parse_move(move)
        move_parsable = true
      rescue
        puts "move not parsable... please try this format: ex: d2, d4"
        next
      end
    end

    [start_space, end_space]
  end

  def parse_move (move)
    "parse_move called with: #{move.inspect}"
    start_loc, end_loc = case move
    when /, / then move.split(', ').map(&:downcase).map{ |loc| loc_to_x_y(loc) }
    when / / then move.split(' ').map(&:downcase).map{ |loc| loc_to_x_y(loc) }
    when /,/ then move.split(',').map(&:downcase).map{ |loc| loc_to_x_y(loc) }
    else raise ArgumentError, "invalid separator"
    end

    [start_loc, end_loc]
  end

  def loc_to_x_y (loc)
    chars = loc.match(/[a-z]+/).to_s.chars

    char_num = chars.map.with_index { |c, i| (('a'..'z').to_a.index(c) + 1) * 26 ** (chars.count - (i + 1)) }.inject(:+)
    num_num  = loc.match(/\d+/).to_s.to_i

    [char_num, num_num]
  end
end
