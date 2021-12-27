#!/usr/bin/env lua

local utils = require("src/utils")
local timestamp = os.date("%Y-%m-%d %X")

--[[ HorseClock ]]--
local triggers = {}
local aliases = {
  [0] = utils.create_alias{
    match="hc-help",
    send=[[ColourNote("white", "blue", "TODO")]]
  }
}
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
