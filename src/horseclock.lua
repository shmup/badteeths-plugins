-- /world.CallPlugin ("DEADBEEFDEADBEEFDEADBEEF", "Foo")

-- when they type something
function OnPluginCommand (sText)
  ColourNote ("red", "", sText)
  return true  -- process the command
end

-- when you connect to the MUD, presumably you are not AFK
function OnPluginConnect ()
  ColourNote ("salmon", "", "Connected!")
end
