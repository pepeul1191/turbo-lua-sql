local turbo = require("turbo")
-- handlers
local HandlerHome = require("handlers.home")
local HandlerDepartamento = require("handlers.departamento")
local HandlerProvincia = require("handlers.provincia")
-- sockets
-- rutas
local routes = {
  {"^/static/(.*)$", turbo.web.StaticFileHandler, "static/"},
  {"^/$", turbo.web.StaticFileHandler, "static/index.html"},
  {"^/home", HandlerHome.Index},
  {"^/departamento/listar", HandlerDepartamento.Listar},
  {"^/provincia/listar/(%d+)", HandlerProvincia.Listar},
}
local M = {}

M.routes = routes
return M
