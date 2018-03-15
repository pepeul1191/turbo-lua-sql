local turbo = require("turbo")
local Listar = class("Listar", turbo.web.RequestHandler)
local Buscar = class("Buscar", turbo.web.RequestHandler)
local _distrito = require("models.distrito")
local json = require("json")
local M = {}

function Buscar:get()
  local nombre = self:get_argument("nombre")
  local distritos = _distrito.buscar(nombre)
  self:write(json.encode(distritos))
end

function Listar:get(provincia_id)
  local distritos = _distrito.listar(provincia_id)
  self:write(json.encode(distritos))
end

M.Buscar = Buscar
M.Listar = Listar
return M
