local turbo = require("turbo")
-- handlers
local HandlerHello = require("handlers.hello")
local HandlerHome = require("handlers.home")
local HandlerMensaje = require("handlers.mensaje")
-- sockets
-- rutas
local routes = {
  {"^/$", HandlerHome.Index},
  {"^/static/(.*)$", turbo.web.StaticFileHandler, "static/"},
  {"^/chat", turbo.web.StaticFileHandler, "static/index.html"},
  {"^/hello", HandlerHello.Index},
}
local M = {}

M.routes = routes
return M
