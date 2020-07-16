class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    case ship
    when nil
      @fired_upon = true
    else
      @fired_upon = true
      @ship.hit
    end

  end

  def render_fire_upon_helper
    case ship
    when nil
      "M"
    else
      if ship.sunk?
        "X"
      else
        "H"
      end
    end
  end

  def render(show_ships = false)
    case @fired_upon
    when false
      if ship == nil
        "."
      else
        if show_ships == true
          "S"
        else
          "."
        end
      end
    else
      render_fire_upon_helper
    end
  end
end
