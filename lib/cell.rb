#Cell Class
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
              #May need to add "Miss" here
      @fired_upon = true
    else
      @fired_upon = true
      @ship.hit
    end

  end

def render_fire_upon_helper
  case ship
  when nil
    p "M"
  else
    if ship.sunk?
      p "X"
    else
      p "H"
    end
  end
end

  def render(show_ships = false)
    case @fired_upon
    when false
      if ship == nil
        p "."
      else
        if show_ships == true
          p "S"
        else
          p "."
        end
      end
    else
    render_fire_upon_helper
    end
  end


end
