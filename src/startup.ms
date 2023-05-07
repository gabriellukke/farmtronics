import "config"

importsafe "Test"

if not me.isBot then
  print "startup.ms ran for home computer"
  exit
end if

if me.isBot then
  print "startup.ms ran for bot"
end if
