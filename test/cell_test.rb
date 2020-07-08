#Cell Class Test
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require 'pry'

class CellTest < Minitest::Test
  def setup
    @cell = Cell.new("B4")
  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

  def test_coordinate
    assert_equal "B4", @cell.coordinate
  end

  def test_ship
    assert_nil @cell.ship
  end

  def test_empty
    assert_equal true, @cell.empty?
  end
end
