class Board

  attr_reader :cells, :rows, :columns

  def initialize(rows = 4, columns = 4)
    @rows = rows
    @columns = columns
    @cells = build_cells
  end

  def build_cells
    cell_hash = {}
    @number_range = 1..@rows
    @letter_range = "A"..(("A".ord)+ @columns - 1).chr

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
    @board_row_array = @letter_range.to_a
    @board_col_array = @number_range.to_a
    @row_array = @coordinate_array.map do |space|
      space.to_str[0]
    end
    @col_array = @coordinate_array.map do |space|
      space.to_str[1].to_i
    end
  end
  
  def array_increments?(coordinate_array)
    first_num = coordinate_array[0]
    coordinate_array[1, coordinate_array.count].each do |n|
      return false if first_num + 1 != n
      first_num = n
    end
    true
  end

  def all_equal?(coordinate_array)
    coordinate_array.uniq.size <= 1
  end

    def consecutive_spaces
      coord_array_setup
      if all_equal?(@col_array)
        true if array_increments?(@row_array)
      elsif array_increments?(@col_array)
        true if all_equal?(@row_array)
      else
        false
      end
    end


    def valid_placement?(ship, coordinate_array)
      @coordinate_array = coordinate_array
      if different_lengths(ship, coordinate_array)
        false
      elsif invalid_coordinate(coordinate_array)
        false
      elsif coordinate_already_has_ship(coordinate_array)
        false
      else
        consecutive_spaces
      end

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


    def different_lengths(ship, coordinate_array)
      ship.length != coordinate_array.length
    end

    ######## might consider adding invalid_coordinate_array to distinguish from valid_coordinate
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


end

