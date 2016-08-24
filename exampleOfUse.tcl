#chain has a few limitations:
# 1. can't have nested anything in the list
# 2. can't have empty arguments anywhere in the chain - the empty argument is replaced by the seed.
# 3. can't use things like incr that directly change the variable
# 4. don't forget to put all the calls in a list.

# no no #1
#chain 1 [list testadd {}] \
#        [list testadd [list testadd 1]]               <---nested!

source ./chain.tcl

puts [::chain::chain "  THIS IS THE SEED, THE OTHER ARGUMENTS MUTATE THE STRING ONE AT A TIME.  " \
            [list string trim {}]       \
            [list ::chain::inspect {}]  \
            [list string tolower {}]    \
            [list inspect {}]           \
            [list string map -nocase {"THE OTHER ARGUMENTS MUTATE THE STRING ONE AT A TIME" "the other arguments can have more than one argument \nand you can specify which one to pass the seed to by indicating an empty \nargument ( {} )"} {}] \
     ]



       #proc needstwo {a b} {
       #  return "worked! $a $b"
       #}
       #proc returnlist {args} {
       #  return [list [lindex $args 0] "abc"]
       #}

       #proc return1 {} {
       #  return Buddy
       #}
       #puts [chain "hello world"     \
       [list string toupper {} ] \
       [list inspect {}]          \
       [list string tolower {}] \
       [list inspect {}]         \
       [list returnlist {}] \
       [list inspect {}]         \
       [list needstwo {} [return1]] \
       [list inspect {}]         ]



     # next steps:
     # we'd really like to make it able to pass multiple parameters
     # maybe by using lassign or {*} with special caharacters like {***}, etc.
