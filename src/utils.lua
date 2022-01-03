local M = {}

M.Types = {
  CMD = "12",
  SW = "11"
}

function M.TableConcat(t1,t2)
  for i=1,#t2 do
    t1[#t1+1] = t2[i]
  end
  return t1
end

-- https://www.gammon.com.au/scripts/doc.php?function=GetAliasOption
function M.create_alias(t)
  local alias = {
    match=t.match,
    enabled="y",
    group="badteeth",
    send_to=t.send_to or M.Types.CMD,
    sequence=t.seq or 100,
  }

  if t.fn then alias.script = t.fn end
  if t.send then alias.send = { t.send } end

  return { alias = alias }
end

function M.create_trigger(t)
  local trigger = {
    match=t.match,
    enabled="y",
    group="badteeth",
    send_to=t.send_to or M.Types.CMD,
    sequence=t.seq or 100,
  }

  if t.fn then trigger.script = t.fn end
  if t.send then trigger.send = { t.send } end

  return { trigger = trigger }
end

function M.write_file(path, junk)
  local file = assert(io.open(path, "w")) -- read/binary mode
  file:write(junk)
  file:close()
  return content
end

function M.read_file(path)
  local file = assert(io.open(path, "rb")) -- read/binary mode
  local content = file:read "*a" -- *a or *all reads the whole file
  file:close()
  return content
end

--[[ https://github.com/britzl/luatoxml
Parse a Lua value (table) into properly formatted XML
If the value is of type string it will be transformed into a tag eg <value/>
If the value is a table each of it's key value pairs will be converted like this:
 * If the key is a number lua_to_xml() will be called again with the value as argument
 * If the key is a string and value is a string a tag will be created with the key as XML tag element and the value as XML-value (eg <key>value</key>)
 * If the key is a string and value is a table a tag will be created with the key as XML tag element and the table values as XML-attributes and nested tags (eg <key a="b"><c... </key>
@param value The value to parse
@return The value as XML --]]
local indentation = ""
function M.lua_to_xml(value)
  local xml = ""
  local t = type(value)
  if t == "string" then
    xml = xml .. indentation .. "<" .. value .. "/>\n"
  elseif t == "table" then
    for name,data in pairs(value) do
      -- if the table key is numeric it's value is parsed
      if type(name) == "number" then
        xml = xml .. M.lua_to_xml(data)
      else
        xml = xml .. indentation .. "<" .. name
        if type(data) == "table" then
          local children = {}
          local number_strings = {}
          for k,v in pairs(data) do
            local vtype = type(v)
            local ktype = type(k)
            if vtype == "table" then
              children[k] = v
            elseif ktype == "string" then
              xml = xml .. " " ..k .. '="' .. tostring(v) .. '"'
            elseif ktype == "number" and vtype == "string" then
              table.insert(number_strings, v)
            end
          end

          if next(children) ~= nil or #number_strings > 1 then
            xml = xml .. ">\n"
            indentation = indentation .. " "
            xml = xml .. M.lua_to_xml(children)
            xml = xml .. M.lua_to_xml(number_strings)
            indentation = indentation:sub(1,#indentation-1)
            xml = xml .. indentation .. "</" .. name .. ">\n"
          else
            if #number_strings == 1 then
              xml = xml .. ">" .. number_strings[1] .. "</" .. name .. ">\n"
            else
              xml = xml .. "/>\n"
            end
          end
        else
          xml = xml .. ">"..data.."</" .. name ..">\n"
        end
      end
    end
  end
  return xml
end

return M
