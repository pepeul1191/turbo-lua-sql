local r = require("rethinkdb")
local json = require("json")
local database = {
  host = 'localhost',
  port = 28015,
  db = 'demo',
  --password = 'pass'
}

local rpta = {}

r.connect(database, function(err, conn)
    r.reql.table("salas").run(conn, function(err, cur)
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

print(json.encode(rpta))