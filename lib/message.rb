class Message

  def welcome_message
    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter q to quit."
    prompt_input

  end

  def ship_placement_message
    p "I have laid out my ships on the grid."
    p "You now need to lay out your two ships."
    p "The Cruiser is three units long and the Submarine is two units long"
  end

  def cruiser_squares
    p "Enter the squares for the Cruiser (3 spaces): "
    prompt_input

  end

  def submarine_squares
    p "Enter the squares for the Submarine (2 spaces): "
    prompt_input

  end

  def invalid_coord_message
    p " Those are invalid coordinates. Please try again:"
    prompt_input
  end

  def shot_message
    p "Enter the coordinate for your shot:"
    prompt_input
  end

  def prompt_input
    p ">  "
    #would like to replace this with a boat emoji if we have time
  end

  def valid_coord_message
    p "Please enter a valid coordinate: "
    prompt_input
  end

  def shot_result(coordinate, board)


  end
  def cpu_result(coordinate, board)
    p "My shot on " + coordinate + shot_result(coordinate, board)

  end
end
