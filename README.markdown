Ghost solver
============

A Ruby script to solve the word game [Ghost](http://en.wikipedia.org/wiki/Ghost_(game\) )

Combinatorial game theory
-------------------------

Combinatorial game theory describes two player, turn-based, finite, deterministic games where the last player to move wins. Ghost is an _impartial game_, meaning the same moves are avaliable to both players (cf. chess, Black can only move black pieces). The Sprague-Grundy theorem (1) demonstrates that every impartial game is equivalent to a Nim-heap. Nim is an impartial game played with matchsticks http://en.wikipedia.org/wiki/Nim

This script determines the height of that Nim-heap.

1. Winning Ways. Conway, Berlekamp, Guy.

Usage
-----

    ghost.rb < yawl.txt

Word list
---------

The word list provided `yawl.txt` is the public domain YAWL (Yet Another Word List).