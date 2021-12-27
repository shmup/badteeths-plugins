#!/usr/bin/env lua

local open = io.open
local timestamp = os.date("%Y-%m-%d %X")

local function read_file(path)
  local file = open(path, "rb") -- r read mode and b binary mode
  local content = file:read "*a" -- *a or *all reads the whole file
  file:close()
  return content
end

local clock_src = read_file("src/horseclock.lua");

local header = [[
<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE muclient>
]]

local data = {
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
}

local template = [=[
<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE muclient>
<muclient>
  <plugin
    name="HorseClock"
    author="badteeth"
    id="DEADBEEFDEADBEEFDEADBEEF"
    language="Lua"
    purpose="Time tracking for horse routes"
    date_written="2021-12-21 16:25:14"
    requires="5.06"
    version="0.1">
    <description trim="y">
      <![CDATA[Piss]]>
    </description>
  </plugin>

  <script>
  <![CDATA[
    -- /world.ReloadPlugin "HorseClock"
    -- /world.CallPlugin ("deadbeefdeadbeefdeadbeef", "Foo")
    function Foo ()
      Note "Bar"
    end
  ]]>
  </script>
</muclient>
]=]

-- print (fileContent);
-- print(template)

local luatoxml = require("src/luatoxml")
local xml = luatoxml.toxml(data)
print(header .. xml)
