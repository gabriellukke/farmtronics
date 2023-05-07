tile = {}

tile.is = function(x, y, tileType)
  tile = here.tile(x, y)
  if tile then        
    if tile.name.lower == tileType then
      log.debug("Found" + tileType + "tile at <", x, ",", y, ">")
        return {"x": x, "y": y}
    end if
  end if
end function

return tile