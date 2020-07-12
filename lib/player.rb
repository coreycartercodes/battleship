require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

class Player
  attr_reader :board, :cruiser, :submarine

  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def cpu_ship_placement
    until @board.valid_placement?(@cruiser, @cpu_place_arr)
      @cpu_place_arr = @board.coord_generator
    end
      @board.place(@cruiser, @cpu_place_arr)
  end
end
