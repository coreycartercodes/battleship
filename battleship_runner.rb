require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/player'
require 'pry'

game = Game.new

game.main_menu

### USED TO TEST RENDERING
puts game.computer.board.render

puts game.player.board.render

game.computer.cpu_ship_placement

puts game.computer.board.render(show_ships = true)
###
