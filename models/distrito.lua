local database = require("config.database")
local M = {}

function buscar(nombre)
  local sql = string.format("SELECT id, nombre FROM vw_distrito_provincia_departamento WHERE nombre LIKE '%s' LIMIT 0,10", nombre .. "%")
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

function listar(provincia_id)
  local sql = string.format("SELECT * FROM distritos WHERE provincia_id = %s", provincia_id)
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

M.buscar = buscar
M.listar = listar
return M
