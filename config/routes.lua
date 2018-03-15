local turbo = require("turbo")
-- handlers
local HandlerHello = require("handlers.hello")
local HandlerHome = require("handlers.home")
local HandlerMensaje = require("handlers.mensaje")
local HandlerDepartamento = require("handlers.departamento")
-- sockets
-- rutas
local routes = {
  {"^/$", HandlerHome.Index},
  {"^/static/(.*)$", turbo.web.StaticFileHandler, "static/"},
  {"^/chat", turbo.web.StaticFileHandler, "static/index.html"},
  {"^/hello", HandlerHello.Index},
  {"^/departamento/listar", HandlerDepartamento.Listar},
}

local M = {}
M.routes = routes
return M
