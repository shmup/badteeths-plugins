local utils = require("src/utils")
local alias = utils.create_alias

local dirs = {'n','e','s','w','nw','ne','sw','se'}

local A = {}
local send_dir = ""

for i=2, 7 do
  for j, dir in ipairs(dirs) do

    if #dir == 1 then
      send_dir = dir
    else
      send_dir = "(" .. dir .. ")"
    end

    table.insert(A, alias{match=i .. dir, send=i .. send_dir, send_to=utils.Types.SW })
  end
end

return A
