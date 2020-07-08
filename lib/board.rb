# Board Class Setup

class Board

  attr_reader :cells

  def initialize
    @cells = {
      A1: Cell.new('A1')
    }
  end

  def valid_coordinate?(coordinate_param)
    @cells.keys.to_s.include?(coordinate_param)
  end

end
