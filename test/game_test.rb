require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/player'

class GameTest < Minitest::Test

  def setup
    @game = Game.new
    @player = Player.new
    @computer= Player.new
  end

  def test_it_exists
    assert_instance_of Game, @game
  end

  def test_cpu_can_win
    3.times {@game.player.cruiser.hit}
    2.times {@game.player.submarine.hit}

    assert @game.cpu_winner
  end

  def test_player_can_win
    3.times {@game.computer.cruiser.hit}
    2.times {@game.computer.submarine.hit}

    assert @game.player_winner
  end

end
