#chain has a few limitations:
# 1. can't have nested anything in the list
# 2. can't have empty arguments anywhere in the chain - the empty argument is replaced by the seed.
# 3. can't use things like incr that directly change the variable
# 4. don't forget to put all the calls in a list.

# no no #1
#chain 1 [list testadd {}] \
#        [list testadd [list testadd 1]]               <---nested!

source ./chain.tcl

puts [chain "  THIS IS THE SEED, THE OTHER ARGUMENTS MUTATE THE STRING ONE AT A TIME.  " \
            [list string trim {}] \
            [list string tolower {}] \
            [list string map -nocase {"THE OTHER ARGUMENTS MUTATE THE STRING ONE AT A TIME" "the other arguments can have more than one argument \nand you can specify which one to pass the seed to by indicating an empty \nargument ( {} )"} {}] \
     ]
