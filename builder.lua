#!/usr/bin/env lua

local utils = require("src/utils")
local my_aliases = require("src/aliases")
local timestamp = os.date("%Y-%m-%d %X")
local my_aliases = require("src/aliases")

local HC = require("src/horseclock")

local HorseClock = utils.generate_plugin{
  name = "HorseClock",
  author = "badteeth",
  id = "DEADBEEFDEADBEEFDEADBEEF",
  language = "Lua",
  purpose = "Time tracking for horse runs",
  triggers = HC.triggers,
  aliases = HC.aliases,
  script = HC.script
}

local Personal = utils.generate_plugin{
  name = "Personal",
  author = "badteeth",
  id = "DEADBEEFDEADBEEFDEADDEAD",
  language = "Lua",
  purpose = "Personal Stuff",
  aliases = my_aliases
}

local header = [[
<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE muclient>
]]

utils.write_file("plugins/HorseClock.xml", header .. utils.lua_to_xml(HorseClock))
utils.write_file("plugins/Personal.xml", header .. utils.lua_to_xml(Personal))
