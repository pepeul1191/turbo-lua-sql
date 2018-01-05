local turbo = require("turbo")
local home = require("handlers.home")

local HelloWorldHandler = class("HelloWorldHandler", turbo.web.RequestHandler)
function HelloWorldHandler:get()
  self:write("Hello World!")
end

local app = turbo.web.Application:new({
  {"/$", home.Index},
  {"/static/(.*)$", turbo.web.StaticFileHandler, "static/"},
  {"/hello", HelloWorldHandler},
})

app:listen(8888)
turbo.ioloop.instance():start()