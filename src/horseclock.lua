local utils = require("src/utils")

local HC = {}

--[[ HorseClock ]]--
HC.triggers = {
  utils.create_trigger{
    match="You tell Donk the dun horse to take you to * and he starts off at a trot.",
    fn="TimerStart"
  },
  utils.create_trigger{
    match="Donk the dun horse slows to a stop*",
    fn="TimerStop"
  },
  utils.create_trigger{
    match="You mess up the rhythm of your riding*",
    fn="TimerStop"
  },
  utils.create_trigger{
    match="Donk the dun horse stops walking",
    fn="TimerStop"
  },
}

HC.aliases = {
  utils.create_alias{
    match="hc-help",
    send=[[
      ColourNote("white", "blue", "HorseClock tries to run/stop when the route starts/stops.")
      ColourNote("white", "blue", "Manually run it with hc-start and hc-stop.")
    ]]
  },
  utils.create_alias{
    match="hc-start",
    fn="TimerStart"
  },
  utils.create_alias{
    match="hc-stop",
    fn="TimerStop"
  }
}

HC.script = utils.read_file("src/horseclock_script.lua");

return HC
