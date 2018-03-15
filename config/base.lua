local turbo = require("turbo")
local Base = class("Base", turbo.web.RequestHandler)
local M = {}

function Base:on_create()
  self:add_header("Server", "Ubuntu")
  self:add_header("X-Powered-By", "\bLua(?: ([\\d.]+))?\\;version:\\1")
end

M.Base = Base
return M
