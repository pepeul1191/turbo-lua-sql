local turbo = require("turbo")
local constants = require("config.constants")
local Index = class("Index", turbo.web.RequestHandler)
local M = {}

function Index:get()
  self:write("home <br> " .. constants.BASE_URL)
end

M.Index = Index
return M