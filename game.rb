#!/usr/bin/env ruby
require_relative './src/Domain/GameBoard'
require_relative 'src/Domain/Room'
require_relative 'src/Domain/Player'
require_relative './src/Exceptions/InvalidDirectionError'
require_relative './src/Exceptions/YouWon'

game = GameBoard.new(2,2)
player = Player.new(game)


require 'tty-prompt'
require 'pastel'

prompt = TTY::Prompt.new(symbols: {marker: ">"})

loop do
  begin
    current_room = player.current_room
    cmd = prompt.ask(current_room.question)
    prompt.say(current_room.player_reaction(cmd, player))
  rescue OutOfBoard, AlreadyHaveArch, InvalidAction,SnakeAttack, InvalidDirectionError => ex
    prompt.warn(ex)
  rescue TypeError => ex
    prompt.warn('Something very bad happened')
  rescue GameIsOver => ex
    prompt.error(ex)
    prompt.error('You need arch to kill Evil')
    break
  rescue YouWon => ex
    prompt.ok(ex)
    break
  end
end