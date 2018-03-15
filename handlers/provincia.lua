local base = require("config.base")
local Listar = class("Listar", base.Base)
local _provincia = require("models.provincia")
local json = require("json")
local M = {}

function Listar:get(departamento_id)
  local provincias = _provincia.listar(departamento_id)
  self:write(json.encode(provincias))
end

M.Listar = Listar
return M
