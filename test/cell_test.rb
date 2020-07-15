require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test
  def setup
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("C2")
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Cell, @cell_1
  end

  def test_coordinate
    assert_equal "B4", @cell_1.coordinate
  end

  def test_ship
    assert_nil @cell_1.ship
  end

  def test_place_ship
    @cell_1.place_ship(@cruiser)
    assert_equal "Cruiser", @cell_1.ship.name
  end

  def test_empty
    assert @cell_1.empty?
  end

  def test_fired_upon?
    refute @cell_1.fired_upon?
    @cell_1.fire_upon
    assert @cell_1.fired_upon?
  end

  def test_health_fire_upon
    @cell_1.place_ship(@cruiser)
    assert_equal 3, @cell_1.ship.health

    @cell_1.fire_upon
    assert_equal 2, @cell_1.ship.health
  end

  def test_render

    @cell_1.place_ship(@cruiser)
    assert_equal ".", @cell_1.render

    assert_equal "S", @cell_1.render(true)

    @cell_1.fire_upon

    assert_equal "H", @cell_1.render

    @cell_1.fire_upon
    @cell_1.fire_upon
    assert_equal "X", @cell_1.render

    assert_equal ".", @cell_2.render

    assert_equal ".", @cell_2.render(true)

    @cell_2.fire_upon

    assert_equal "M", @cell_2.render

  end

end
