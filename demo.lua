local mysql = require("luasql.mysql")
local env  = mysql.mysql()
local conn = env:connect("gestion","root","123")
local inspect = require("inspect")
local M = {}

function insertar()
  local nombre = "Zika"
  local sql = string.format("INSERT INTO departamentos (nombre, pais_id) VALUES ('%s', %s)", nombre, 1)
  print(sql)
  cursor,error_string = conn:execute(sql)
  if error_string then
    print(error_string)
  else
    local id = conn:getlastautoid()
    print(id)
  end
end

insertar()
