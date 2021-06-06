#!/usr/bin/env ruby
require_relative './src/Domain/GameBoard'
require_relative 'src/Domain/Room'
require_relative 'src/Domain/Player'
require_relative './src/Exceptions/InvalidDirectionError'
require_relative './src/Exceptions/YouWon'

game = GameBoard.new(2, 2)
player = Player.new(game)


require 'tty-prompt'
require 'pastel'

prompt = TTY::Prompt.new(symbols: { marker: '>' })
name = prompt.ask('welcome to Game, Your mission is killing The Evil, What is your name?')
name = 'default user ' if name.nil?
loop do

  current_room = player.current_room
  cmd = prompt.ask("#{name}, #{current_room.question}")
  current_room.player_reaction(cmd, player)
rescue OutOfBoard, AlreadyHaveArch, InvalidAction, SnakeAttack, InvalidDirectionError => e
  prompt.warn(e)
rescue TypeError
  prompt.warn('Something very bad happened')
rescue GameIsOver => e
  prompt.error(e)
  prompt.error('You need arch to kill Evil')
  break
rescue YouWon => e
  prompt.ok(e)
  break

end
