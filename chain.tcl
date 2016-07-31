proc add {arg} {
  return [incr arg]
}
proc chain {args} {
  set a 1
  foreach arg $args {
    set a [$arg $a]
  }
  return $a
}

puts [chain [list add] [list add]]

# above is a simplified version of the idea.
# here are my notes
#   proc chain args
#     split on new line or args or something
#     loop
#       run the first line and set its return to a variable
#       encapsulate that in a list with the other arguments that should be before or behind it.
#     repeat
#     return result
#   end proc

#   Alternatively,
#     you can net the calls and run that and return that.
#       proc chain args
#         split on new line or args or something
#         loop
#           create string of code
#         repeat
#         return [lastarg [lastarg-1 [lastarg-2 possible other variables ... [firstarg Starting variables ] other variables ] other variables ]]    