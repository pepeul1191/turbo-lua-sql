local turbo = require("turbo")
-- handlers
local HandlerHome = require("handlers.home")
local HandlerDepartamento = require("handlers.departamento")
local HandlerProvincia = require("handlers.provincia")
local HandlerDistrito = require("handlers.distrito")
-- sockets
-- rutas
local routes = {
  {"^/static/(.*)$", turbo.web.StaticFileHandler, "static/"},
  {"^/$", turbo.web.StaticFileHandler, "static/index.html"},
  {"^/home", HandlerHome.Index},
  {"^/departamento/listar", HandlerDepartamento.Listar},
  {"^/provincia/listar/(%d+)", HandlerProvincia.Listar},
  {"^/distrito/buscar", HandlerDistrito.Buscar},
  {"^/distrito/nombre/(%d+)", HandlerDistrito.NombreCompleto},
  {"^/distrito/listar/(%d+)", HandlerDistrito.Listar},
}
local M = {}

M.routes = routes
return M
