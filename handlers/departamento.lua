local turbo = require("turbo")
local Listar = class("Listar", turbo.web.RequestHandler)
local _departamento = require("models.departamento")
local json = require("json")
local M = {}

function Listar:get()
  local departamentos = _departamento.listar()
  self:write(json.encode(departamentos))
end

M.Listar = Listar
return M
