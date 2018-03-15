local database = require("config.database")
local M = {}

function listar()
  cursor,error_string = database.conn:execute([[select * from departamentos]])
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
    return rpta
  end
end

M.listar = listar
return M
