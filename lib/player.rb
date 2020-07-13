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
    cpu_place = Array.new(3)
    cpu_place[0] = @board.cells.keys.shuffle[0]
    randomizer = rand(1000)

    if randomizer.even?
      cpu_place[1] = "#{cpu_place[0][0] + (cpu_place[0][1]+1).to_s}"
      cpu_place[2] = "#{cpu_place[0][0] + (cpu_place[0][1]+2).to_s}"
    else
      cpu_place[1] = "#{(cpu_place[0][0].ord+1).chr + cpu_place[0][1].to_s}"
      cpu_place[2] = "#{(cpu_place[0][0].ord+2).chr + cpu_place[0][1].to_s}"
    end
    if @board.valid_placement?(@cruiser, cpu_place)
      @board.place(@cruiser, cpu_place)
    else
      cpu_ship_placement
    end
  end

end
