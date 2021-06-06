Game Assignment:
=

Introduction:
===
I wrote a simple game, works with pure ruby. As I talked to HR manager in this code there might not be ruby best practices; because I told her I worked with ruby 3 years ago, she said if you can learn again it matter.
Also the positios of room in board are hard coded, I according to lack of time and simplicity I made it like that , but it can be random too.

How to start:
===
make sure you run ``bundle install `` then run ``./game.rb``

The Game:
====
game is a board game, which start at 0,0 end at 3,3 (you can change it to 8,8 , 9,9 or what ever). The are obstacles(snake) and equipments(in this game we have arc) during the adventure which helps you to kill the Evil. 

you start at 0,0 and can move in four directions right/left/up/down, when you move you might face with following rooms that has:

- **Snake**: you have two options when you enter to snake room, run or attack. You can not attack it(remind us snake ladder game), if you attack it will bite you and you will get back to start position. you just can run away.
- **Arc**: you can take arch that will help you to attack the evil, with out arch you can not kill evil.
- **Evil**: Evil can be killed with arch else you will lose the game, please first take arch then attack Evil.

How to play:
====
just follow directions and start as it is.

Test:
===
I wrote tests with Rspec and it has high coverage, Run 
>  bundle exec rspec

Sample:
===

if you want to win, move in following order:
> right -> right -> take -> up -> up -> run -> right -> up -> kill

if you want to lose, move in following order:
> right -> up -> run -> right -> up -> kill

