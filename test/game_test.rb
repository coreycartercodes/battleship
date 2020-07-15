require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'


class GameTest < Minitest::Test

  def setup
    @game = Game.new
    @player_board = Board.new
    @cpu_board = Board.new
  end

  def test_it_exists
    assert_instance_of Game, @game
  end

  def test_welcome_message #need to change this to have an assertion, just printing the main menu right now 
    p @game.main_menu
  end

  #test both player and cpu have boards
  #test both player and cpu have ships
  #test cpu can place both ships
  #test player can place both ships
  #test player shot
  #test cpu shot
  #test cpu win
  #test player win
end
