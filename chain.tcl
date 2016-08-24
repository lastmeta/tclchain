namespace eval ::chain {

  proc chain {seed args} {
    foreach arg $args {
      set index [lsearch -all $arg {}]
      foreach in $index {
        set arg [lreplace $arg $in $in $seed]
      }
      set seed [{*}$arg]
    }
    return $seed
  }

  proc inspect {args} {
    puts {*}$args
    return {*}$args
  }
}

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
