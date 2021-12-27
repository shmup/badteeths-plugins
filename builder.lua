#!/usr/bin/env lua

local utils = require("src/utils")
local timestamp = os.date("%Y-%m-%d %X")

local header = [[
<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE muclient>
]]

local clock_src = utils.read_file("src/horseclock.lua");

local xml = utils.lua_to_xml({
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
    script = {"<![CDATA[\n" .. clock_src .. "\n]]>"}
  }
})

print(header .. xml)
