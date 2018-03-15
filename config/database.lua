local sqlite3 = require "luasql.sqlite3"
local M = {}

local env  = sqlite3.sqlite3()

function conn()
  local conn = env:connect('db/ubicaciones.db')
  return conn
end

M.conn = conn
M.close = close
M.env = env
return M
