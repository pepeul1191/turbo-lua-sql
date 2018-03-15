local base = require("config.base")
local Listar = class("Listar", base.Base)
local Buscar = class("Buscar", base.Base)
local NombreCompleto = class("NombreCompleto", base.Base)
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

function NombreCompleto:get(distrito_id)
  local nombre = _distrito.nombre_completo(distrito_id)
  self:write(nombre)
end

M.Buscar = Buscar
M.NombreCompleto = NombreCompleto
M.Listar = Listar
return M
