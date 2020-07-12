require 'pry'

class Game

  attr_reader :board, :ship

  def initialize
    @board = Board.new
    @ship = ship
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
  end

  def main_menu

    until @input == "p" || @input == "q"
      p "Welcome to BATTLESHIP"
      p "Enter p to play. Enter q to quit."
      print "> "
      @input = gets.chomp.downcase
      break if @input == 'q'
    end

    if @input == 'p'
      game_setup
    else
    end

  end

  def game_setup

    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long"
    puts @board.render

    # @player_cruiser = Ship.new(cruiser, 3)
    player_ship_place

  end

  def player_ship_place
    # until @player_input == @board.valid_placement?(@player_cruiser, @player_input)
    #   p "Those are invalid coordinates. Please try again:"
    #   @player_input = []
    #   puts "Time to enter the squares for the Cruiser (3 spaces): "
    #   puts "Please enter your first square "
    #   print "> "
    #   square_1 = gets.chomp.upcase
    #   @player_input << square_1
    #   p "Please enter your second square "
    #   print "> "
    #   square_2 = gets.chomp.upcase
    #   @player_input << square_2
    #   p "Please enter your final square "
    #   print "> "
    #   square_3 = gets.chomp.upcase
    #   @player_input << square_3
    #   break if @board.valid_placement?(@player_cruiser, @player_input)
    # end
    @player_input = []
    puts "Time to enter the squares for the Cruiser (3 spaces): "
    puts "Please enter your first square "
    print "> "
    square_1 = gets.chomp.upcase!
    @player_input << square_1
    p "Please enter your second square "
    print "> "
    square_2 = gets.chomp.upcase!
    @player_input << square_2
    p "Please enter your final square "
    print "> "
    square_3 = gets.chomp.upcase!
    @player_input << square_3

    until @player_input == @board.valid_placement?(@player_cruiser, @player_input)
      p "Those are invalid coordinates. Please try again: "
      break if @board.valid_placement?(@player_cruiser, @player_input)
    end
    #
    if @player_input == @board.valid_placement?(@player_cruiser, @player_input)
      @board.place(@player_cruiser, @player_input)
      puts @board.render(true)
      puts "Enter the squares for the Submarine (2 spaces): "
      print "> "
    end
    player_submarine_place
  end

  def player_submarine_place
    sub_input = gets.chomp.upcase
    until sub_input == @board.valid_placement?(ship, coordinate_array)
      p "Those are invalid coordinates. Please try again:"
    end
    if sub_input == @board.valid_placement?(ship, coordinate_array)
      puts @board.render(true)
    end
    player_turn
  end

  # def player_turn
  #   loop do
  #
  # end



end
