Ghost solver
============

A Ruby script to solve the word game [Ghost](http://en.wikipedia.org/wiki/Ghost_(game\)). It prints a short crib sheet describing a winning strategy.

Combinatorial game theory
-------------------------

Combinatorial game theory describes two player, turn-based, deterministic games where a player loses if he can't make a move. Chess, Go and Ghost are all combinatorial games. In particular, Ghost is an _impartial game_, meaning the same moves are avaliable to both players. Chess is _not_ impartial because Black cannot move the white pieces. [Nim](http://en.wikipedia.org/wiki/Nim) is a famous impartial game played with matchsticks. The Sprague-Grundy theorem (1) demonstrates that every impartial game is equivalent to a Nim-heap of some height.

This script determines the height of the Nim-heap equivalent to Ghost.

1. Conway, Berlekamp, Guy (1982). _Winning Ways for your Mathematical Plays_

Inspiration
---------

Randall Munroe (_xkcd_ artist) [solved Ghost](http://blog.xkcd.com/2007/12/31/ghost/) too.

Installation
------------

    git clone https://github.com/hickford/ghost.git
    cd ghost
    bundle install

Bundler will install the gem [fast_trie](http://rubygems.org/gems/fast_trie). Alas, this gem [might not build on Windows](https://github.com/tyler/trie/issues/3).

Usage
-----

Assuming you have a word list at `/usr/share/dict/words`

    ruby ghost.rb

Otherwise, to use your own word list, say `web2.txt`

    ruby ghost.rb web2.txt

You can download the free [Web2 word list](http://svnweb.freebsd.org/base/head/share/dict/web2?view=co) courtesy of FreeBSD. (2.4MB text file) 

Performance
----------

On a 2.5MB word list (250,000 words) the script takes about 1 minute to run on my computer.

