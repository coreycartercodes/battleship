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
    @board = Board.new
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
    assert @board.valid_coordinate?("A1")
    assert @board.valid_coordinate?("D4")
    refute @board.valid_coordinate?("A5")
    refute @board.valid_coordinate?("E1")
    refute @board.valid_coordinate?("A22")
  end

  def test_invalid_coordinate_array
    refute @board.invalid_coordinate_array(["A1", "A2", "A3"])
    assert @board.invalid_coordinate_array(["D3", "D4", "D5"])
    refute @board.valid_placement?(@cruiser, ["Z1", "Z2", "Z3"])
  end

  def test_valid_placement_length
    refute @board.valid_placement?(@cruiser, ["A1", "A2"])
    refute @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
    assert @board.valid_placement?(@cruiser, ["A2", "A3", "A4"])
  end

  def test_consecutive_coordinates
    refute @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    refute @board.valid_placement?(@cruiser, ["A2", "A1", "A4"])
    refute @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
  end

  def test_valid_placement_not_diagonal
    refute @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
  end

  def test_coordinate_already_has_ship
    @board.place(@cruiser, ["A1", "A2", "A3"])
    assert @board.coordinate_already_has_ship(["A1", "B2"])
    refute @board.coordinate_already_has_ship(["B1", "B2"])
  end

  def test_ships_do_not_overlap
    @board.place(@cruiser, ["A1", "A2", "A3"])
    refute @board.valid_placement?(@submarine, ["A1", "A2"])
    assert @board.valid_placement?(@submarine, ["B1", "B2"])
  end

  def test_it_can_place_ships
    @board.place(@cruiser, ["A1", "A2", "A3"])
    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]

    assert_equal @cruiser, cell_1.ship
    assert_equal @cruiser, cell_2.ship
    assert_equal @cruiser, cell_3.ship
    assert_equal true, cell_3.ship == cell_2.ship
  end

  def test_board_render
    @board.place(@cruiser, ["A1", "A2", "A3"])

    normal_render = " 1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . ."
    assert_equal normal_render, @board.render

    @board.cells["A1"].fire_upon
    @board.cells["A2"].fire_upon

    hit_render = " 1 2 3 4 \nA H H . . \nB . . . . \nC . . . . \nD . . . ."
    assert_equal hit_render, @board.render

    @board.cells["A3"].fire_upon
    sunk_render = " 1 2 3 4 \nA X X X . \nB . . . . \nC . . . . \nD . . . ."
    assert_equal sunk_render, @board.render

    @board.cells["B3"].fire_upon
    miss_render = " 1 2 3 4 \nA X X X . \nB . . M . \nC . . . . \nD . . . ."
    assert_equal miss_render, @board.render
  end

  def test_board_render_true
    @board.place(@cruiser, ["A1", "A2", "A3"])

    normal_render = " 1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . ."
    assert_equal normal_render, @board.render(true)

    @board.cells["A1"].fire_upon
    @board.cells["A2"].fire_upon

    hit_render = " 1 2 3 4 \nA H H S . \nB . . . . \nC . . . . \nD . . . ."
    assert_equal hit_render, @board.render(true)
  end
end
