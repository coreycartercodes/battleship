require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/player'
require 'pry'

game = Game.new

game.main_menu

game.computer.cpu_ship_placement

game.player_place_ships

game.player_cruiser

game.player_submarine

game.turn
