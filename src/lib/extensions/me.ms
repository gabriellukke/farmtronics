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

me.goTo = function(x=0, y=0)
  log.debug("Currently at " + me.position.x + "," + me.position.y)
  attempts = 0

  while me.position.x != x or me.position.y != y
    log.debug("Going to " + x + "," + y)

    attempts = attempts + 1
    if attempts > 10 then
      log.error("I'm stuck at " + x + "," + y)
      return
    end if

    dx = x - me.position.x
    dy = y - me.position.y

    // check if there is a block in front of me
    if me.ahead and me.ahead.passable == 0 then
      log.debug("There is a block in front of me, turning around")
      if dx == 0 and dy < 0 then
        me.face("right")
      else if dx == 0 and dy > 0 then
        me.face("left")
      else if dy == 0 and dx < 0 then
        me.face("down")
      else if dy == 0 and dx > 0 then
        me.face("up")
      end if
      me.steps()
    end if

    if dx != 0 then
      xDirection = ""
      if dx > 0 then
        xDirection = xDirection + "Moving to right "
        me.face("right")
      else
        xDirection = xDirection + "Moving to left "
        me.face("left")
      end if

      xDirection = xDirection + abs(dx) + " steps"
      log.debug(xDirection)

      me.steps(abs(dx))
    end if

    if dy != 0 then
      yDirection = ""
      if dy > 0 then
        yDirection = yDirection + "Moving to down "
        me.face("down")
      else
        yDirection = yDirection + "Moving to up "
        me.face("up")
      end if

      yDirection = yDirection + abs(dy) + " steps"
      log.debug(yDirection)

      me.steps(abs(dy))
    end if 
  end while
end function

// DOC - get latest tool status in inventory
me.getTool = function(type)
    return me.inventory.find(type, "type")
end function


// DOC - use watering tool to water, check watering can remaining water after action
me.water = function()
    tool = self.getTool("wateringcan")
    
    if not tool then 
        log.error("Does not have watering can")
        return
    end if

    // check water level before watering
    if tool.waterLeft == 0 then
        log.debug("Out of water.")
        me.refillLocal()
    end if   

    
    me.select(tool.name)
    me.useTool

    // check water level after watering
    if tool.waterLeft == 0 then
        log.debug("Out of water.")
        me.refillLocal()
    end if
end function
