local turbo = require("turbo")
local constants = require("config.constants")
local Index = class("Index", turbo.web.RequestHandler)
local M = {}

function Index:on_create()
  self:add_header("Server", "Ubuntu")
  self:add_header("X-Powered-By", "\bLua(?: ([\\d.]+))?\\;version:\\1")
end

function Index:get()
  self:write("home <br> " .. constants.BASE_URL)
end

M.Index = Index
return M
