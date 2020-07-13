require 'pry'
class Game

  attr_reader :player_board, :computer_board, :player_ships, :computer_ships

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @player_ships = {
      "Cruiser" => Ship.new("Cruiser", 3),
      "Submarine" => Ship.new("Submarine", 2)
    }
    @computer_ships = {
      "Cruiser" => Ship.new("Cruiser", 3),
      "Submarine" => Ship.new("Submarine", 2)
    }
  end

  def main_menu
    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter q to quit."
    print "> "
    input = gets.chomp.downcase
    if input == 'p'
      #computer_place_ships
      player_place_ships
      #turn
    elsif input == 'q'
      exit
    else
      p "You don't listen to directions, huh? Try again."
      sleep 4.0 
      main_menu
    end
  end

  def player_place_ships
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long"
    puts @player_board.render(true)
    player_cruiser
  end

  def player_cruiser
    puts "Enter the squares for the Cruiser (3 spaces): "
    print "> "
    cruiser_input = gets.chomp.upcase.split(" ")
    if @player_board.valid_placement?(@player_ships["Cruiser"], cruiser_input)
      @player_board.place(@player_ships["Cruiser"], cruiser_input)
      puts @player_board.render(true)
    else
      puts "Those are invalid coordinates. Please try again: "
      print "> "
      player_cruiser
    end
    player_submarine
  end

  def player_submarine
    puts "Enter the squares for the Submarine (2 spaces): "
    print "> "
    submarine_input = gets.chomp.upcase.split(" ")
    if @player_board.valid_placement?(@player_ships["Submarine"], submarine_input)
      @player_board.place(@player_ships["Submarine"], submarine_input)
      puts @player_board.render(true)
    else
      puts "Those are invalid coordinates. Please try again: "
      print "> "
      player_submarine
    end
  end




end
