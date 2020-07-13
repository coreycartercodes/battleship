require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

game = Game.new

puts game.computer.board.render

puts game.player.board.render

game.computer.cpu_ship_placement

puts game.computer.board.render(show_ships = true)
