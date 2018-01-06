local r = require("rethinkdb")
local database = require("config.database")
local inspect = require("inspect")
local M = {}

function listar()
  local rpta = {}
  r.connect(database.db, function(err, conn)
      r.reql.table("mensajes").run(conn, function(err, cur)
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

function cargar(conversacion_id)
  local rpta = nil
  r.connect(database.db, function(err, conn)
      r.reql.table("mensajes").filter{conversacion_id = conversacion_id}.run(conn, function(err, cur)
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

function crear(conversacion_id)
  local rpta = nil
  r.connect(database.db, function(err, conn)
    r.reql.table("mensajes").insert{conversacion_id = conversacion_id}.run(conn, function(err, cur)
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

M.crear = crear
M.listar = listar
M.cargar = cargar
return M