import "config"
import "main"

importsafe "Test"
importsafe "Log"

if not me.isBot then
  print "startup.ms ran for home computer"
  exit
end if

if me.isBot then
  // prevent reinitializing log in globals
  if not globals.hasIndex("log") then     
    globals.log = new Log
    log.init
    log.setInvoker(me.name)
    log.setMode("debug")
  end if
  print "startup.ms ran for bot"
end if
