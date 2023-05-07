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