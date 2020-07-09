require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class BoardTest < Minitest::Test
  def setup
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    # ships_used = [@cruiser, @submarine]

    @board = Board.new(4, 4)
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_has_correct_number_cells
    assert_equal 16, @board.cells.keys.length
  end

  def test_cell_coordinates_all_in_board
    columns = (1..4).to_a
    rows = ("A".."D").to_a

    @board.cells.keys.each do |coordinate|
      assert rows.include?(coordinate[0])
      assert columns.include?(coordinate[1..-1].to_i)
    end
  end

  def test_valid_coordinate
    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal true, @board.valid_coordinate?("D4")
    assert_equal false, @board.valid_coordinate?("A5")
    assert_equal false, @board.valid_coordinate?("E1")
    assert_equal false, @board.valid_coordinate?("A22")
  end

  def test_invalid_coordinate
    assert_equal false, @board.invalid_coordinate(["A1", "A2", "A3"])
    assert_equal true, @board.invalid_coordinate(["D3", "D4", "D5"])
  end

  def test_valid_placement_length
    # skip
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
    assert_equal true, @board.valid_placement?(@cruiser, ["A2", "A3", "A4"])
  end

  def test_consecutive_coordinates
    skip
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
  end

  def test_valid_placement_not_diagonal
    skip
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
  end

  def test_coordinate_already_has_ship
    @board.place(@cruiser, ["A1", "A2", "A3"])

    assert_equal true, @board.coordinate_already_has_ship(["A1", "B2"])
    refute @board.coordinate_already_has_ship(["A1", "B2"])
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "B2"])
    assert_equal true, @board.valid_placement?(@submarine, ["B1", "B2"])
  end
end
