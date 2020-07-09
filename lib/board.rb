class Board

  attr_reader :cells, :rows, :columns

  def initialize(rows = 4, columns = 4)
    @rows = rows
    @columns = columns

    @cells = build_cells

  end

  def build_cells
    cell_hash = {}
    number_range = 1..@columns
    letter_range = "A"..(("A".ord)+ @rows - 1).chr

    number_range.each do |number|
      letter_range.each do |letter|
        coordinate = letter + number.to_s
        cell_hash[coordinate] = Cell.new(coordinate)
      end
    end
    cell_hash
  end

  def valid_coordinate?(coordinate_param)
    @cells.keys.to_s.include?(coordinate_param)
  end

  def valid_placement?(ship, coordinate_array)
    return false if different_lengths(ship, coordinate_array)
    # return false if
    return true

  end

  def different_lengths(ship, coordinate_array)
    ship.length != coordinate_array.length
  end



  # def valid_placement?(ship, spaces_array)
  #   @spaces_array = spaces_array
  #   # require 'pry'; binding.pry
  #   if ship.length != @spaces_array.length
  #     false
  #   # elsif coordinate_already_hold_ship(spaces_array)
  #   #   false
  #   else
  #     consecutive_spaces
  #   end
  # end

  # def place(ship, spaces_array)
  #   @spaces_array = spaces_array
  #   @ship = ship
  #
  #   @spaces_array.each do |key|
  #     @cells[key.to_sym].place_ship(ship)
  #   end
  # 
  # end

  # def coordinate_already_hold_ship(spaces_array)
  #   spaces_array.any? {|coordinate| @cells[coordinate].ship}
  # end

end
