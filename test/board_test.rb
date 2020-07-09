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
    assert_equal 'A1', @board.cells[:"A1"].coordinate
  end

  def test_valid_coordinate

    assert_equal true, @board.valid_coordinate?('A1')
    refute @board.valid_coordinate?('Z1')
  end

  def test_valid_placement_length
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    refute @board.valid_placement?(cruiser, ["A1", "A2"])

  end

####
  def test_valid_placement
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert @board.valid_placement?(cruiser, ["A1", "A2", "A3"])
    assert @board.valid_placement?(cruiser, ["B2", "C2", "D2"])

    refute @board.valid_placement?(cruiser, ["A1", "A2"])
    refute @board.valid_placement?(submarine, ["A1", "A2", "A3"])
    refute @board.valid_placement?(cruiser, ["A1", "B2", "C3"])

  end

#   def test_valid_placement_consecutive_row
#     cruiser = Ship.new("Cruiser", 3)
#     submarine = Ship.new("Submarine", 2)
#
#     assert @board.row_subset_of_range?
#
#   end
#
# ####
#   def test_valid_placement_consecutive_column
#     cruiser = Ship.new("Cruiser", 3)
#     submarine = Ship.new("Submarine", 2)
#
#     assert @board.col_subset_of_range?
#
#   end
#
# #####
#   def test_valid_placement_not_diagonal
#     cruiser = Ship.new("Cruiser", 3)
#     submarine = Ship.new("Submarine", 2)
#
#
#
#   end


end
