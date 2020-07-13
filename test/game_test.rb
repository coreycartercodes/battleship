require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/message'
require 'pry'

class GameTest < Minitest::Test

  def setup
    @game = Game.new
    @player_board = Board.new
    @cpu_board = Board.new
  end

  def test_it_exists
    assert_instance_of Game, @game
  end

  def test_welcome_message
    p @game.main_menu
  end

end
