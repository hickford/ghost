#!/usr/bin/env ruby
require 'trie'  # from the gem fast_trie
@letters = ('a'..'z').to_a.reverse 
@trie = Trie.new

@max_legal = 2     # are short English words legal?
# warn "Short English words length at most #{@max_legal} will be admissible"

share_dict_words = "/usr/share/dict/words"

source = ARGF

if ARGF.path == "-" and $stdin.tty?
    if File.exists? share_dict_words
        source = IO.readlines(share_dict_words)
        warn "Building trie from dictionary #{share_dict_words}"
    else
        warn "(Type in the dictionary-or quit and pipe one in)"
    end
else
    warn "Building trie from dictionary #{ARGF.path}"
end


for line in source
    word = line.chomp
    if word != word.downcase
        next
    end
    if word.length > @max_legal      # one and two letter English words are legal
        @trie.add(word, -1) # -1 means not a valid move
    end
end
# 6 seconds to build trie
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
