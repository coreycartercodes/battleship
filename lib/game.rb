require 'pry'
require './lib/player'

class Game

  attr_reader :player, :computer
  def initialize
    @player = Player.new
    @computer= Player.new
  end

  def main_menu
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    print "\u{1f6a2}  "
    puts "\n"
    input = gets.chomp.downcase
    if input == 'p'
      @computer.cruiser_placement
      @computer.sub_placement
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
  #### It is placing 2 submarines again.
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
    turn
  end

  def turn
    display_boards
    @computer.player_turn
    if @computer.cruiser.sunk? && @computer.submarine.sunk?
      puts "You beat a computer *woooooow*"
      puts "You won: game over"
      puts "\n"
      main_menu
    end
    @player.computer_turn
    if @player.cruiser.sunk? && @player.submarine.sunk?
      puts "VICTORY IS MINE!"
      puts "\n"
      main_menu
    end
    sleep 1
    turn
  end

  def display_boards
    puts "=============COMPUTER BOARD============="
    puts @computer.board.render
    puts "\n"
    puts "==============PLAYER BOARD=============="
    puts @player.board.render(true)
  end

end
