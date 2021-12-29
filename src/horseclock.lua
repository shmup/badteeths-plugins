-- /world.CallPlugin ("DEADBEEFDEADBEEFDEADBEEF", "Foo")

-- when they type something
function OnPluginCommand (sText)
  return true  -- process the command
end

-- when you connect to the MUD, presumably you are not AFK
function OnPluginConnect ()
  ColourNote ("salmon", "", "Connected!")
end

local cache = {}

function TimerStart(name, line, wc)
  cache.start = utils.timer()
  cache.destination = wc[1] or "somewhere"

  ColourNote("white", "blue", "Off to " .. cache.destination .. "!")
end

function TimerStop(name, line, wc)
  cache.stop = utils.timer()
  cache.diff = string.format("%.2f", cache.stop - cache.start)

  local msg = "Arrived at " .. cache.destination .. " after " .. cache.diff .. " seconds"

  if string.find(line, "mess up the rhythm") then
    msg = "Oops, you lasted " .. cache.diff .. " seconds"
  end

  ColourNote("white", "blue", msg)
end
