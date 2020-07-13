require 'pry'
require './lib/player'

class Game

  ### Corey's Player Class usage
  attr_reader :player, :computer
  def initialize
    @player = Player.new
    @computer= Player.new
  end
  ###

  # attr_reader :player_board, :computer_board, :player.submarine, :computer.cruiser
  #
  # def initialize
  #   @player_board = Board.new
  #   @computer_board = Board.new
  #   @player_ships = {
  #     "Cruiser" => Ship.new("Cruiser", 3),
  #     "Submarine" => Ship.new("Submarine", 2)
  #   }
  #   @computer_ships = {
  #     "Cruiser" => Ship.new("Cruiser", 3),
  #     "Submarine" => Ship.new("Submarine", 2)
  #   }
  # end

  def main_menu
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    print "\u{1f6a2}  "
    puts "\n"
    input = gets.chomp.downcase
    if input == 'p'
      #computer_place_ships
      player_place_ships
    elsif input == 'q'
      puts "Okay, quitter \u{1f644}"
      puts "\n"
      exit
    else
      puts  "You don't listen to directions, huh? Try again."
      puts "\u{1f644} \u{1f644} \u{1f644}"
      puts "\n"
      main_menu
    end
  end

  def player_place_ships
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long"
    puts @player.board.render(true)
    player_cruiser
  end

  def player_cruiser
    puts "Enter the squares for the Cruiser (3 spaces): "
    print "\u{1f6a2}  "
    cruiser_input = gets.chomp.upcase.split(" ")
    if @player.board.valid_placement?(@player.cruiser, cruiser_input)
      @player.board.place(@player.cruiser, cruiser_input)
      puts @player.board.render(true)
    else
      puts "Those are invalid coordinates. Please try again: "
      print "\u{1f6a2}  "
      player_cruiser
    end
    player_submarine
  end

  def player_submarine
    puts "Enter the squares for the Submarine (2 spaces): "
    print "\u{1f6a2}  "
    submarine_input = gets.chomp.upcase.split(" ")
    if @player.board.valid_placement?(@player.submarine, submarine_input)
      @player.board.place(@player.submarine, submarine_input)
      puts @player.board.render(true)
    else
      puts "Those are invalid coordinates. Please try again: "
      puts "\u{1f644} \u{1f644} \u{1f644}"
      player_submarine
    end
  end

  def turn
    display_boards
    player_turn_message
    # computer_turn
    if @computer.cruiser.sunk? && @computer.submarine.sunk?
      puts "You beat a computer *woooooow*"
      puts "You won: game over"
      exit
    end
  end

  def display_boards
    puts "=============COMPUTER BOARD============="
    #puts @computer.board.render
    puts "                "
    puts "==============PLAYER BOARD=============="
    puts @player.board.render(true)
  end

  def player_turn_message
    puts "Enter the coordinate for your shot...choose wisely!"
    print "\u{1f6a2}  "

    input = gets.chomp.upcase.to_s
    if input != @board.valid_coordinate?(input)
      puts "#{input} is not a valid coordinate"
      puts "Let's try this again"
      puts "\u{1f644} \u{1f644} \u{1f644}"
      player_turn
    elsif @computer.board.cells[input].fired_upon?
      puts "You have already fired upon this spot. TRY AGAIN"
      puts "\u{1f644} \u{1f644} \u{1f644}"
      player_turn
    else
      @computer.board.cells[input].fire_upon
      if @computer.board.cells[input].render == "M"
        puts "Your shot on #{input} was a...MISS"
      elsif @computer.board.cells[input].render == "H"
        puts "Your shot on #{input} was a hit...lucky guess"
      elsif @computer.board.cells[input].render == "X"
        puts "Welp. Your shot on #{input} sunk my ship."
        puts "I hope you're happy \u{1f62d}"
      end
    end
  end


end
