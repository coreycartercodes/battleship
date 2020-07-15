require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test
  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Ship, @cruiser
  end

  def test_it_has_name
    assert_equal "Cruiser", @cruiser.name
  end

  def test_length
    assert_equal 3, @cruiser.length
  end

  def test_health
    assert_equal 3, @cruiser.health
  end

  def test_if_it_has_sunk
    assert_equal false, @cruiser.sunk?
  end

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
