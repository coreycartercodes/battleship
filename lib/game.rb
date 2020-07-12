require 'pry'
require './lib/player'

class Game
  attr_reader :player, :computer

  def initialize
    @player = Player.new
    @computer= Player.new
  end

  def main_menu
    # need to pull in welcome_message from Message class
    input = gets.chomp.downcase

    if input == "p"
      game_setup
    else

    end
  end

  def game_setup
  end

end
