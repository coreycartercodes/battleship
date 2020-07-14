require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require 'pry'

class CellTest < Minitest::Test
  def setup
    @cell1 = Cell.new("B4")
    @cell2 = Cell.new("C2")
    @cruiser = Ship.new("Cruiser", 3)
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
    @cell1.place_ship(@cruiser)
    assert_equal "Cruiser", @cell1.ship.name
  end

  def test_empty
    assert_equal true, @cell1.empty?
  end

  def test_fired_upon?
    assert_equal false, @cell1.fired_upon?
    @cell1.fire_upon
    assert_equal true, @cell1.fired_upon?
  end

  def test_health_fire_upon
    @cell1.place_ship(@cruiser)
    assert_equal 3, @cell1.ship.health

    @cell1.fire_upon
    assert_equal 2, @cell1.ship.health
  end

  def test_render         #Should we break this up?

    @cell1.place_ship(@cruiser)
    assert_equal ".", @cell1.render

    assert_equal "S", @cell1.render(true)

    @cell1.fire_upon

    assert_equal "H", @cell1.render

    @cell1.fire_upon
    @cell1.fire_upon
    assert_equal "X", @cell1.render

    assert_equal ".", @cell2.render

    assert_equal ".", @cell2.render(true)

    @cell2.fire_upon

    assert_equal "M", @cell2.render

  end

end
