require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

game = Game.new
puts game.computer.board.render

puts game.player.board.render

game.computer.cpu_ship_placement

puts game.player.board.render(show_ships = true)

#
# @number_range = (1..@columns).to_a
# @letter_range = ("A"..(("A".ord)+ @rows - 1).chr).to_a
