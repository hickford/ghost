Ghost solver
============

A Ruby script to solve the word game [Ghost](http://en.wikipedia.org/wiki/Ghost_(game\) ).

Combinatorial game theory
-------------------------

Combinatorial game theory describes two player, turn-based, deterministic games where where a player loses if he can't play. Chess, Go and Ghost are combinatorial games. Further, Ghost is an _impartial game_, meaning the same moves are avaliable to both players (where as in chess, Black can only move black pieces). [Nim](http://en.wikipedia.org/wiki/Nim) is a famous impartial game played with matchsticks. The Sprague-Grundy theorem (1) demonstrates that every impartial game is equivalent to a Nim-heap. 

This script determines the height of the Nim-heap equivalent to Ghost.

1. Winning Ways. Conway, Berlekamp, Guy.

Installation
------------

    git clone https://github.com/matt-hickford/ghost.git
    cd ghost
    bundle install

Usage
-----

    ghost.rb < yawl.txt > solution.txt

Word list
---------

The word list provided `yawl.txt` is the public domain YAWL (Yet Another Word List).

