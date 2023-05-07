// Extend "me" module with some useful functions

// DOC - turn to a direction
me.face = function(direction)
  if not direction then
    log.debug("me.face: no direction given")
    return
  end if

  log.debug("me.face: turning to " + direction)
  dirs = {"up": 0, "right": 1, "down": 2, "left": 3}
  while me.facing != dirs[direction]
    me.left
  end while
end function

// DOC - move forward n steps
me.steps = function(steps=1)
  log.debug("me.steps: moving " + steps + " steps")
  for i in range(1, steps)
    me.forward
  end for
end function
