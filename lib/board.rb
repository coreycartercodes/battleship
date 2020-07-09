# Board Class Setup


class Board

  attr_reader :cells

  def initialize
    @cells = {
      "A1": Cell.new('A1'),
      "A2": Cell.new('A2'),
      "A3": Cell.new('A3'),
      "A4": Cell.new('A4'),
      "B1": Cell.new('B1'),
      "B2": Cell.new('B2'),
      "B3": Cell.new('B3'),
      "B4": Cell.new('B4'),
      "C1": Cell.new('C1'),
      "C2": Cell.new('C2'),
      "C3": Cell.new('C3'),
      "C4": Cell.new('C4'),
      "D1": Cell.new('D1'),
      "D2": Cell.new('D2'),
      "D3": Cell.new('D3'),
      "D4": Cell.new('D4')
    }
  end

  def valid_coordinate?(coordinate_param)
    @cells.keys.to_s.include?(coordinate_param)
  end

def coord_array_setup
  @range_row_array = ("A".."D").to_a
  @range_col_array = ("1".."4").to_a
  @row_array = @spaces_array.map do |space|
    space.to_str[0]
  end
  @col_array = @spaces_array.map do |space|
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

  def valid_placement?(ship, spaces_array)
    @spaces_array = spaces_array
    if ship.length != @spaces_array.length
      false
    else
      consecutive_spaces
    end
  end

  def place(ship, spaces_array)
    @spaces_array = spaces_array
    @ship = ship

    @spaces_array.each do |key|
      @cells[key.to_sym].place_ship(ship)
    end

  end

end
