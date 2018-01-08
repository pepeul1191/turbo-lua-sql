local inspect = require("inspect")
local M = {}

function count(tabla)
  local count = 0
  for _ in pairs(tabla) do count = count + 1 end
  return count
end

function has_key(tabla, key)
  local existe = false
  for k, v in pairs(tabla) do
    if k == key then
      existe = true
      break
    end
  end
  return existe
end

M.count = count
M.has_key = has_key
return M