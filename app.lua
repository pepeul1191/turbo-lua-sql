_G.TURBO_SSL = true
local turbo = require("turbo")
local routes = require("config.routes")
local app = turbo.web.Application:new(
  routes.routes,
  {
    cookie_secret = "akofdkapokfposakfdsafasdåpfkadåpf"
  }
)

app:listen(8888)
turbo.ioloop.instance():start()