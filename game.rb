require_relative 'board'
require_relative 'player'

class Game

  attr_reader :board, :current_player

  def initialize
    @board = Board.new(game: self, size_x: 8, size_y: 8)
    @player_1 = Player.new(game: self, name: 'p1', color: 'white')
    @player_2 = Player.new(game: self, name: 'p2', color: 'black')

    @current_player = @player_1
    @status = {
      finished: false,
      winner: nil
    }
  end

  def play
    while @status[:finished] == false
      @current_player.take_turn

      update_current_player
      update_status
    end
  end

  def opponent
    @current_player == @player_1 ? @player_2 : @player_1
  end

  #######################################################################################################################
  private

  def update_current_player
    @current_player = @current_player == @player_1 ? @player_2 : @player_1
  end

  def update_status
    if @current_player.in_check? && !@current_player.move_available?
      @status[:winner] = opponent
      @status[:finished] = true
    elsif !@current_player.move_available?
      @status[:finished] = true
    end
  end
end
