local turbo = require("turbo")
local Index = class("Index", turbo.web.RequestHandler)
local json = require("json")
local M = {}

function Index:on_create()
  self:add_header("Server", "Ubuntu")
  self:add_header("X-Powered-By", "\bLua(?: ([\\d.]+))?\\;version:\\1")
  print("HELLO.LUA - Before:prepare")
end

function Index:get()
  self:write("Mensajes")
end

M.Index = Index
return M