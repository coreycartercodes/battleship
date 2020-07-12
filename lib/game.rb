require 'pry'

class Game

  # def initialize
  #
  # end

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
