require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'

class PlayerTest < Minitest::Test

  def setup
    @player = Player.new
    @computer= Player.new
  end

  def test_it_exists
    assert_instance_of Player, @player
    assert_instance_of Player, @computer
  end

  def test_computer_can_place_cruiser
    @computer.cruiser_placement
    cruiser_coord = []
    @computer.board.cells.values.each do |cell|
      if cell.empty? == false
        cruiser_coord << cell
      end
    end

    assert_equal cruiser_coord[0].ship, @computer.cruiser
    assert_equal cruiser_coord[1].ship, @computer.cruiser
    assert_equal cruiser_coord[2].ship, @computer.cruiser
    assert_nil cruiser_coord[3]
  end

  def test_computer_can_place_submarine
    @computer.sub_placement
    sub_coord = []
    @computer.board.cells.values.each do |cell|
      if cell.empty? == false
        sub_coord << cell
      end
    end

    assert_equal sub_coord[0].ship, @computer.submarine
    assert_equal sub_coord[1].ship, @computer.submarine
    assert_nil sub_coord[2]
  end

end
