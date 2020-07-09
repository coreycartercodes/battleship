class Board

  attr_reader :cells, :rows, :columns

  def initialize(rows = 4, columns = 4)
    @rows = rows
    @columns = columns
    @cells = build_cells
  end

  def build_cells
    cell_hash = {}
    @number_range = 1..@columns
    @letter_range = "A"..(("A".ord)+ @rows - 1).chr

    @number_range.each do |number|
      @letter_range.each do |letter|
        coordinate = letter + number.to_s
        cell_hash[coordinate] = Cell.new(coordinate)
      end
    end
    cell_hash
  end

  def valid_coordinate?(coordinate_param)
    @cells.keys.to_s.include?(coordinate_param)
  end

################ Needs Fixed as part of Valid Placement
  def coord_array_setup
    @range_row_array = @number_range.to_a
    @range_col_array = @letter_range.to_a
    @row_array = @coordinate_array.map do |space|
      space.to_str[0]
    end
    @col_array = @coordinate_array.map do |space|
      space.to_str[1]
    end
  end
  ### Will not account for out of order entries
  def row_subset_of_range?
    cross_ref_row = @range_row_array & @row_array
    cross_ref_row.sort == @row_array
  end
  def col_subset_of_range?
    cross_ref_col = @range_col_array & @col_array
    cross_ref_col.sort == @col_array
  end
  ### notes: all?.each_cons
  def consecutive_spaces
    coord_array_setup
    case row_subset_of_range?
    when true
      @col_array.all? {|value| value == @col_array[0]}
    else
      case col_subset_of_range?
      when true
        @row_array.all? {|value| value == @row_array[0]}
      else
        false
      end
    end
  end


  def different_lengths
    @ship.length != @coordinate_array.length
  end

  def invalid_coordinate_array
  end

  def valid_placement?(ship, coordinate_array)
    @ship = ship
    @coordinate_array = coordinate_array
    if different_lengths
      false
    elsif invalid_coordinate_array
      false
    else
      consecutive_spaces
    end
  end

  def place(ship, spaces_array)
    @coordinate_array = _array
    @ship = ship
    @coordinate_array.each do |key|
      @cells[key.to_sym].place_ship(ship)
    end
  end
end
#######################################################

# def coordinate_already_hold_ship(spaces_array)
#   spaces_array.any? {|coordinate| @cells[coordinate].ship}
# end
