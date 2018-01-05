local turbo = require("turbo")
local M = {}

local Index = class("Index", turbo.web.RequestHandler)

function Index:on_create()
  print("HELLO.LUA - Before:prepare")
end

function Index:get()
  self:write("Hello World!")
end

M.Index = Index
return M