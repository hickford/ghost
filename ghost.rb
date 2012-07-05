#!/usr/bin/env ruby
require 'trie'  # from the gem fast_trie
@letters = ('a'..'z').to_a.reverse 
@max_legal = 2     # are short English words legal?

share_dict_words = "/usr/share/dict/words"

source = ARGF
if ARGF.path == "-" and $stdin.tty?
    # no input given
    # use /usr/share/dict/words if possible
    if File.exists? share_dict_words
        source = IO.readlines(share_dict_words)
        warn "Building trie from dictionary #{share_dict_words}"
    else
        warn "(Type in the dictionary-or quit and pipe one in)"
    end
else
    warn "Building trie from dictionary #{ARGF.path}"
end
warn "Short words length at most #{@max_legal} will be ignored"

@dictionary = Trie.new
for line in source
    word = line.chomp
    next if word != word.downcase or word.length <= @max_legal
    @dictionary.add(word)
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

@game = Trie.new
def evaluate(node)
    return if node.nil?
    if node.terminal?
        @game.add(node.full_state,false)
        return false
    else
        chv = @letters.map {|x| evaluate(node.walk(x)) }
        answer = mex(chv)
        @game.add(node.full_state,answer)
        return answer
    end
end

def print_nimbers(node)
    return if node.nil?
    @letters.map {|x| print_nimbers(node.walk(x)) }
    nimber = node.value ? "*#{node.value}" : "#"
    puts "#{node.full_state} #{nimber}"
end

def strategy(node,parent)
    return if node.nil?
    if node.value == false
       return parent==0 ? [node.full_state] : nil
    end
    return if node.value > 0 and parent > 0

    children = @letters.map{ |x| strategy(node.walk(x),node.value)}.find_all{ |x| !x.nil?}
    return children.flatten if node.value == 0
    return children.min_by{|x| x.length}
end

warn "Solving game"
x = evaluate(@dictionary.root)
warn ""
puts "Ghost has value in combinatorial game theory the nimber *#{x}"
winner = x > 0 ? "first" : "second"
puts "ie. The #{winner} player can always win"
puts
#print_nimbers(@game.root)
puts "Winning strategies for first player:"
for letter in @letters
    node = @game.root.walk(letter)
    if !node.nil? and node.value == 0
        puts "* #{strategy(node,0).join(", ")}"
    end
end
puts
puts "Winning strategies for second player if first player errs:"
for letter in @letters
    node = @game.root.walk(letter)
    if !node.nil? and node.value > 0
        puts "* #{strategy(node,0).join(", ")}"
    end
end
