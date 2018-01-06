local r = require("rethinkdb")
local database = require("config.database")
local inspect = require("inspect")
local M = {}

function listar()
  local rpta = {}
  r.connect(database.db, function(err, conn)
      r.reql.table("conversaciones").run(conn, function(err, cur)
        local results, err = cur.to_array()
        if not results then
          -- handle err
        end
        for _, row in ipairs(results) do
          --print(json.encode(row))
          table.insert(rpta, row)
        end
      end
      )
    end
  )
  return rpta
end

function existe(empresa_id, usuario_id)
  local rpta = nil
  r.connect(database.db, function(err, conn)
      r.reql.table("conversaciones").filter{empresa_id = empresa_id, usuario_id = usuario_id}.run(conn, function(err, cur)
        local results, err = cur.to_array()
        if not results then
          rpta = 0
        end
        for _, row in ipairs(results) do
          rpta = row
        end
      end
      )
    end
  )
  return rpta
end

function crear(empresa_id, usuario_id)
  local rpta = nil
  r.connect(database.db, function(err, conn)
      r.reql.table("conversaciones").insert{empresa_id = empresa_id, usuario_id = usuario_id}.run(conn, function(err, cur)
        local results, err = cur.to_array()
        if not results then
          -- handle err
        end
        for _, row in ipairs(results) do
          rpta = row
        end
      end
      )
    end
  )
  return rpta.generated_keys[1]
end

function editar()
end

function eliminar()
end

M.listar = listar
M.existe = existe
M.crear = crear
M.editar = editar
M.eliminar = eliminar
return M