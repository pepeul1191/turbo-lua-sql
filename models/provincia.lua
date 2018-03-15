local database = require("config.database")
local M = {}

function listar(departamento_id)
  local sql = string.format("SELECT * FROM provincias WHERE departamento_id = %s", departamento_id)
  cursor,error_string = database.conn():execute(sql)
  if error_string then
    return {error = error_string}
  else
    local rpta = {}
    row = cursor:fetch ({}, "a")
    while row do
      table.insert(rpta, {
        id = row.id,
        nombre = row.nombre
      })
      row = cursor:fetch (row, "a")
    end
    cursor:close()
    return rpta
  end
end

M.listar = listar
return M
