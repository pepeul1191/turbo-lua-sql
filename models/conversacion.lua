local r = require("rethinkdb")
local database = require("config.database")
local inspect = require("inspect")
local utils = require("config.utils")
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

--[=====[ 
  r.connect(database.db, function(err, conn)
        r.reql.table("conversaciones").filter{usuario_id_1 = usuario_id_1, usuario_id_2 = usuario_id_2}.run(conn, function(err, cur)
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
--]=====]

function existe(usuario_id_1, usuario_id_2)
  local rpta = 0
  r.connect(database.db, function(err, conn)
      r.reql.table("conversaciones").run(conn, function(err, cur)
        local results, err = cur.to_array()
        if not results then
          rpta = 0
        else
          for _, row in ipairs(results) do
            local usuarios = row.usuarios
            if utils.exist(usuarios, usuario_id_1)  and utils.exist(usuarios, usuario_id_2) then
              rpta = row
            end
          end
        end
      end
      )
    end
  )
  return rpta
end

function crear(usuario_id_1, usuario_id_2)
  local rpta = nil
  r.connect(database.db, function(err, conn)
      r.reql.table("conversaciones").insert{usuarios = {usuario_id_1, usuario_id_2}}.run(conn, function(err, cur)
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

M.listar = listar
M.existe = existe
M.crear = crear
return M