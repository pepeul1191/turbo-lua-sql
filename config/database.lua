local sqlite3 = require "luasql.sqlite3"
local M = {}

local env  = sqlite3.sqlite3()
local conn = env:connect('db/ubicaciones.db')

M.conn = conn
return M
