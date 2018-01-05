local turbo = require("turbo")
local M = {}

local Index = class("Index", turbo.web.RequestHandler)
function Index:get()
  self:write("home")
end

M.Index = Index
return M