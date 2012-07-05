#!/usr/bin/env ruby
require 'trie'
@letters = ('a'..'z').to_a.reverse 
@trie = Trie.new

@max_legal = 2     # are short English words legal?
# warn "Short English words length at most #{@max_legal} will be admissible"

warn "Building trie from dictionary #{ARGF.filename}"
if ARGF.filename == "-" and $stdin.tty?
    warn "(Type in the dictionary-or quit and pipe one in)"
end

for line in ARGF
    word = line.chomp
    if word.length > @max_legal      # one and two letter English words are legal
        @trie.add(line.chomp, -1)
    end
end
# 6 seconds to build trie
# -1 means not a valid move

warn "Trie built" 

# nimbers

def mex(set)
    i = 0
    while set.include?(i)
        i += 1
    end
    return i
end

@t2 = Trie.new

def evaluate(node,noisy=false)
    if node.nil?
        return -1
    elsif node.terminal?
        @t2.add(node.full_state,-1)
        if noisy then puts "#{node.full_state} #" end # BANG!   
        return -1
    elsif node.leaf?
        return -1
    else
        chv = @letters.map {|x| evaluate(node.walk(x),noisy) }
        answer = mex(chv)
        @t2.add(node.full_state,answer)       # this line adds six seconds
        if noisy then puts "#{node.full_state} *#{answer}" end
        return answer
    end
end

warn "Solving game"
x = evaluate(@trie.root,noisy=true)
warn "Ghost has value in combinatorial game theory the nimber *#{x}"
