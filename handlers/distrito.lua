local turbo = require("turbo")
local Listar = class("Listar", turbo.web.RequestHandler)
local _distrito = require("models.distrito")
local json = require("json")
local M = {}

function Listar:get(provincia_id)
  local distritos = _distrito.listar(provincia_id)
  self:write(json.encode(distritos))
end

M.Listar = Listar
return M
