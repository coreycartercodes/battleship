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
#    def consecutive_spaces
#     coord_array_setup
#     case row_subset_of_range?
#     when true
#       @col_array.all? {|value| value == @col_array[0]}
#     else
#       case col_subset_of_range?
#       when true
#         @row_array.all? {|value| value == @row_array[0]}
#       else
#         false
#       end
#     end
#   end


  def valid_placement?(ship, coordinate_array)
    if different_lengths(ship, coordinate_array)
      false
    elsif invalid_coordinate(coordinate_array)
      false
    elsif coordinate_already_has_ship(coordinate_array)
      false
    else
      #consecutive_spaces
      true
    end
  end

  def different_lengths(ship, coordinate_array)
    ship.length != coordinate_array.length
  end

  def invalid_coordinate(coordinate_array)
    coordinate_array.any? {|coordinate| !valid_coordinate?(coordinate)}
  end

  def coordinate_already_has_ship(coordinate_array)
    coordinate_array.any? {|coordinate| @cells[coordinate].ship}
  end

  def place(ship, coordinate_array)
    if valid_placement?(ship, coordinate_array)
      coordinate_array.each do |coordinate|
        @cells[coordinate].place_ship(ship)
      end
      true
    else
      false
    end
  end

#   def render_helper
#     if @cell.ship == nil
#       p "M"
#     elsif @cell.ship
#   end
#
#   def render(show_ships = false )
#     if @cell.fired_upon? == false
#       if show_ships == true
#         p "S"
#       else
#         p "."
#       end
#     else
#     end
#   end
# end
