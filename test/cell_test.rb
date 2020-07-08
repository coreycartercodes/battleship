#Cell Class Test
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require 'pry'

class CellTest < Minitest::Test
  def setup
    @cell1 = Cell.new("B4")
  end

  def test_it_exists
    assert_instance_of Cell, @cell1
  end

  def test_coordinate
    assert_equal "B4", @cell1.coordinate
  end

  def test_ship
    assert_nil @cell1.ship
  end

  def test_place_ship
    @cell1.place_ship("Cruiser")
    assert_equal "Cruiser", @cell1.ship
  end

  def test_empty
    assert_equal true, @cell1.empty?
  end

  def test_fired_upon?
    assert_equal false, @cell1.fired_upon?
    @cell1.fire_upon
    assert_equal true, @cell1.fired_upon?
  end

end
