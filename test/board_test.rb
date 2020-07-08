# Board Test Setup
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_it_has_cells
    assert_equal 'A1', @board.cells[:A1].coordinate
  end

  def test_valid_coordinate
#require "pry"; binding.pry

    assert_equal true, @board.valid_coordinate?('A1')
    refute @board.valid_coordinate?('B1')
  end

end
