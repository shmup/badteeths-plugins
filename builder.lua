#!/usr/bin/env lua

local utils = require("src/utils")
local my_aliases = require("src/aliases")
local timestamp = os.date("%Y-%m-%d %X")

--[[ HorseClock ]]--
local triggers = {
  [1] = utils.create_trigger{
    match="You tell Donk the dun horse to take you to * and he starts off at a trot.",
    fn="TimerStart"
  },
  [2] = utils.create_trigger{
    match="Donk the dun horse slows to a stop*",
    fn="TimerStop"
  },
  [3] = utils.create_trigger{
    match="You mess up the rhythm of your riding*",
    fn="TimerStop"
  },
  [4] = utils.create_trigger{
    match="Donk the dun horse stops walking",
    fn="TimerStop"
  },
}

local hc_aliases = {
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
local aliases = utils.TableConcat(my_aliases, hc_aliases)
local clock_src = utils.read_file("src/horseclock.lua");
local HorseClock = {
  muclient = {
    plugin = {
      name = "HorseClock",
      author = "badteeth",
      id = "DEADBEEFDEADBEEFDEADBEEF",
      language = "Lua",
      purpose = "Time tracking for horse runs",
      date_written = timestamp,
      requires = "5.06",
      version = "0.1"
    },
    triggers = triggers,
    aliases = aliases,
    script = {"<![CDATA[\n" .. clock_src .. "]]>"}
  }
}
local header = [[
<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE muclient>
]]

utils.write_file("HorseClock.xml", header .. utils.lua_to_xml(HorseClock))
