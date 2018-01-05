local r = require("rethinkdb")
local database = require("config.database")
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

M.listar = listar
return M