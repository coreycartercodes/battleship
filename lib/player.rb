require './lib/ship'
require './lib/board'

class Player
  attr_reader :board, :cruiser, :submarine

  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def cruiser_placement
    @cruiser_place = @board.cells.keys.shuffle[0..2]
    if @board.valid_placement?(@cruiser, @cruiser_place)
      @board.place(@cruiser, @cruiser_place)
    else
      cruiser_placement
    end
  end

  def sub_placement
    @sub_place = @board.cells.keys.shuffle[0..1]
    if @board.valid_placement?(@submarine, @sub_place)
      @board.place(@submarine, @sub_place)
    else
      sub_placement
    end
  end

  def player_turn
    puts "Enter the coordinate for your shot...choose wisely!"
    print "\u{1f6a2}  "

    input = gets.chomp.upcase.to_s
    if @board.valid_coordinate?(input) == false
      puts "#{input} is not a valid coordinate"
      puts "Let's try this again"
      puts "\u{1f644} \u{1f644} \u{1f644}"
      player_turn
    elsif @board.cells[input].fired_upon?
      puts "You have already fired upon this spot. TRY AGAIN"
      puts "\u{1f644} \u{1f644} \u{1f644}"
      player_turn
    else
      @board.cells[input].fire_upon
      if @board.cells[input].render == "M"
        puts "Your shot on #{input} was a...MISS"
      elsif @board.cells[input].render == "H"
        puts "Your shot on #{input} was a hit...lucky guess"
      elsif @board.cells[input].render == "X"
        puts "Welp. Your shot on #{input} sunk my ship."
        puts "I hope you're happy \u{1f62d}"
      end
    end
  end

end
