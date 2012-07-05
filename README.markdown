Ghost solver
============

A Ruby script to solve the word game [Ghost](http://en.wikipedia.org/wiki/Ghost_(game\)). It prints a short crib sheet describing a winning strategy.

Combinatorial game theory
-------------------------

Combinatorial game theory describes two player, turn-based, deterministic games where a player loses if he can't make a move. Chess, Go and Ghost are all combinatorial games. In particular, Ghost is an _impartial game_, meaning the same moves are avaliable to both players. Chess is _not_ impartial because Black cannot move the white pieces. [Nim](http://en.wikipedia.org/wiki/Nim) is a famous impartial game played with matchsticks. The Sprague-Grundy theorem (1) demonstrates that every impartial game is equivalent to a Nim-heap of some height.

This script determines the height of the Nim-heap equivalent to Ghost.

1. Winning Ways. Conway, Berlekamp, Guy.

Installation
------------

    git clone https://github.com/matt-hickford/ghost.git
    cd ghost
    bundle install

Usage
-----

Assuming you have a word list at `/usr/share/dict/words`

    ruby ghost.rb

Otherwise, to use your own word list

    ruby ghost.rb words.list

You can download a free word list from [FreeBSD](http://www.freebsd.org/cgi/cvsweb.cgi/src/share/dict/web2?rev=1.12;content-type=text%2Fplain) (caution big text file!)
