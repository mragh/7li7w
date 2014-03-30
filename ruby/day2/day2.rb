#FIND
#Find out how to access files with and without code blocks. What is the benfeit of the code block?
open(filename, mode="r")
open(filename, mode="r"){|file| }
    #can process & close a file all in one block
#How would you translate a hash into an array? Can you translate arrays into hashes?
h = { "c" => 300, "a" => 100, "d" => 400, "c" => 300  }
answer1 = h.to_a
array = [[:foo, :bar], [1, 2]]
answer2 = array.to_h
#Can you iterate through a hash?
h = { "a" => 100, "b" => 200 }
h.each {|key, value| puts "#{key} is #{value}" }
#You can use Ruby arrays as stacks. What other commmon data structures do arrays support?
#queue
#DO
#Print the contents of an array of sixteen numbers, four numbers at a time,  using just each. Now, do the same with each_slice in Enumerable.
arry = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
i = 0
while i < 16
    slc = arry[i..i+3].each {|x| print x, ","}
    puts ""
    i = i+4
end
    #part 2
arry.each_slice(4) {|x| print x}
#The Tree class was interesting, but it did not allow you to specify a new tree with a clean user interface. Let the initializer accept a nested structure of hashes. You should be able to specify a tree like this:
    # {'grandpa' => {'dad' => {'child 1' => {}, 'child 2' => {}}, 'uncle' => {'child 3' => {}, 'child 4' => {}}}}
class Tree
    attr_accessor :children, :node_name

    def initialize(name, children=[])
        @children = children.to_a.map {|pair| Tree.new(pair[0], pair[1])}
        @node_name = name
    end

    def visit_all(&block)
        visit &block
        children.each {|c| c.visit_all &block}
    end

    def visit(&block)
        block.call self
    end
end

#Write a simple grep that will print the lines of a file having any occurences of a phrase anywhere in that line. You will need to do a simple regex match and read lines from a file. If you want, include line numbers.
i = 0
open("test.txt", "r") {|f| 
    f.readlines.each {|line|
        i = i + 1
        if /brown fox/.match(line)
            puts "#{i} -- #{line}"
        end
    }
}
