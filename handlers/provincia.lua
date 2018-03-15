local turbo = require("turbo")
local Listar = class("Listar", turbo.web.RequestHandler)
local _provincia = require("models.provincia")
local json = require("json")
local M = {}

function Listar:get(departamento_id)
  local provincias = _provincia.listar(departamento_id)
  self:write(json.encode(provincias))
end

M.Listar = Listar
return M
