require './lib/cell' #do we need this? Is there a way to call it without requiring the file?

class Board

  attr_reader :cells, :rows, :columns

  def initialize(rows = 4, columns = 4)
    @rows = rows
    @columns = columns
    @number_range = (1..@columns).to_a
    @letter_range = ("A"..(("A".ord)+ @rows - 1).chr).to_a
    @cells = build_cells
  end

  def build_cells
    cell_hash = {}

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
    @row_array = @coordinate_array.map do |space|
      space.to_str[0]
    end
    @col_array = @coordinate_array.map do |space|
      space.to_str[1].to_i
    end
  end

  def horizontal?(coordinate_array)
    @coordinate_array.map {|coordinate| coordinate[0]}.uniq.count == 1
  end

  def vertical?(coordinate_array)
    @coordinate_array.map {|coordinate| coordinate[1]}.uniq.count == 1
  end

  def consecutive_spaces?(coordinate_array)
    if horizontal?(coordinate_array)
      nums = @coordinate_array.map {|coordinate| coordinate[1].to_i}
      nums.each_cons(2).all? {|x, y| y == x + 1}
    elsif vertical?(coordinate_array)
      nums = @coordinate_array.map {|coordinate| coordinate[0].ord}
      nums.each_cons(2).all? {|x, y| y == x + 1}
    else
      false
    end
  end

  def valid_placement?(ship, coordinate_array)
    @coordinate_array = coordinate_array
    if different_lengths(ship, coordinate_array)
      false
    elsif invalid_coordinate_array(coordinate_array)
      false
    elsif coordinate_already_has_ship(coordinate_array)
      false
    else
      consecutive_spaces?(coordinate_array)
    end
  end

  def different_lengths(ship, coordinate_array)
    ship.length != coordinate_array.length
  end

  def invalid_coordinate_array(coordinate_array)
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
    end
  end

  def render(show_ships = false)
    if show_ships == true
      return "  1 2 3 4 \nA #{@cells["A1"].render(true)} #{@cells["A2"].render(true)} #{@cells["A3"].render(true)} #{@cells["A4"].render(true)} \nB #{@cells["B1"].render(true)} #{@cells["B2"].render(true)} #{@cells["B3"].render(true)} #{@cells["B4"].render(true)} \nC #{@cells["C1"].render(true)} #{@cells["C2"].render(true)} #{@cells["C3"].render(true)} #{@cells["C4"].render(true)} \nD #{@cells["D1"].render(true)} #{@cells["D2"].render(true)} #{@cells["D3"].render(true)} #{@cells["D4"].render(true)}"
    else
      return "  1 2 3 4 \nA #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render} \nB #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render} \nC #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render} \nD #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render}"
    end
  end

end
