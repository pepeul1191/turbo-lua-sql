local turbo = require("turbo")
local constants = require("config.constants")
local M = {}

local Index = class("Index", turbo.web.RequestHandler)
function Index:get()
  self:write("home <br> " .. constants.BASE_URL)
end

M.Index = Index
return M