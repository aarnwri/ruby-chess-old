

class Board

  def initialize (game:, size_x:, size_y:)
    @game = game
    @size_x = size_x
    @size_y = size_y

    @spaces = initialize_spaces
  end

  def [] (x, y)
    @spaces[[x, y]]
  end

  def []= (x, y, value)
    @spaces[[x, y]] = value
  end

  def has_space? (location)
    @spaces.has_key?(location)
  end

  def to_s
    str  = "     A   B   C   D   E   F   G   H    \n"
    str << "   ---------------------------------  \n"
    (1..@size_y).reverse_each do |y|
      str << "#{y}  |"
      (1..@size_x).each do |x|
        piece = (self[x, y] && self[x, y].to_s) || " "
        str << " #{piece} |"
      end
      str << "  \n"
      str << "   ---------------------------------  \n"
    end
    str << "     A   B   C   D   E   F   G   H    \n"
  end

########################################################################################################################
  private

  def initialize_spaces
    spaces = {}
    (1..@size_x).each { |x| (1..@size_y).each { |y| spaces[[x, y]] = nil } }

    spaces
  end
end
