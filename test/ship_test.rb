#Ship Class Test
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require 'pry'

class ShipTest < Minitest::Test
  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end

  #test it exists
  def test_it_exists
    assert_instance_of Ship, @cruiser
  end
  #test it has a name
  def test_it_has_name
    assert_equal "Cruiser", @cruiser.name
  end
  #test the length of the Ship
  def test_length
    assert_equal 3, @cruiser.length
  end
  #test the health of the ship
  def test_health
    assert_equal 3, @cruiser.health
  end
  #test if it has sunk?
  def test_if_it_has_sunk
    assert_equal false, @cruiser.sunk?
  end
  #test it has been hit
  def test_health_change_after_hit
    @cruiser.hit

    assert_equal 2, @cruiser.health
  end

  def test_sunk_after_hit
    @cruiser.hit

    assert_equal false, @cruiser.sunk?
  end

  def test_sunk_after_three_hit
    @cruiser.hit

    assert_equal false, @cruiser.sunk?

    @cruiser.hit

    assert_equal false, @cruiser.sunk?

    @cruiser.hit

    assert_equal true, @cruiser.sunk?
  end
end
