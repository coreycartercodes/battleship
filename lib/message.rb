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
    case board.cells[coordinate].render
    when "M"
      " was a miss."
    when "H"
      " hit a ship!"
    when "X"
      " sunk a ship!" #should we add ship name here?
    end
  end

  def cpu_result(coordinate, board)
    p "My shot on " + coordinate + shot_result(coordinate, board)
  end

  def player_result(coordinate, board)
    p "Your shot on " + coordinate + shot_result(coordinate, board)
  end

  def player_win
    p "Congrats, you beat a computer. Would you like a medal?"
  end

  def cpu_win
    p "Suck it, I won! Let's play again!"
  end

  def cpu_board(cpu)
    p "=============COMPUTER BOARD============="
    p cpu.render
  end

  def player_board(player)
    p "==============PLAYER BOARD=============="
    p player.render(true)
  end

end
