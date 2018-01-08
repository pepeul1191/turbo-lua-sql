local r = require("rethinkdb")
local database = require("config.database")
local inspect = require("inspect")
local M = {}

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
  return rpta.mensajes
end

function crear(conversacion_id)
  local rpta = nil
  r.connect(database.db, function(err, conn)
    r.reql.table("mensajes").insert{conversacion_id = conversacion_id, mensajes = {}}.run(conn, function(err, cur)
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

function actualizar(conversacion_id, usuario_id, mensaje)
  local mensajes = nil
  r.connect(database.db, function(err, conn)
      r.reql.table("mensajes").filter{conversacion_id = conversacion_id}.run(conn, function(err, cur)
        local results, err = cur.to_array()
        if not results then
          -- handle err
        end
        for _, row in ipairs(results) do
          mensajes = row.mensajes
        end
        table.insert(mensajes, mensaje)
        r.reql.table("mensajes").filter{conversacion_id = conversacion_id}.update({mensajes = mensajes}).run(conn, 
          function(err, cur)
            local results, err = cur.to_array()
          end
        )
      end
      )
    end
  )
end

M.crear = crear
M.cargar = cargar
M.actualizar = actualizar
return M