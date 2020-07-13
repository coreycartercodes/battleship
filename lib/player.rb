require './lib/ship'
require './lib/board'

class Player
  attr_reader :board, :cruiser, :submarine

  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def cpu_ship_placement
    @cpu_place = @board.cells.keys.shuffle[0..2]
    if @board.valid_placement?(@cruiser, @cpu_place)
      @board.place(@cruiser, @cpu_place)
    else
      cpu_ship_placement
    end
  end

end
