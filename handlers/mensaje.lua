local turbo = require("turbo")
local WSMensaje = class("WSMensaje", turbo.websocket.WebSocketHandler)
local M = {}

function WSMensaje:prepare()
  local tipo = self:get_argument("tipo")
  print(tipo)
end

function WSMensaje:open(msg)
  local tipo = self:get_argument("tipo")
  local id_usuario = self:get_argument("id_usuario")
  --self.options.chatroom:subscribe(id_usuario, self)
  self:write_message("OPEN!!!")
end

function WSMensaje:on_message(msg)
  local tipo = self:get_argument("tipo")
  print(tipo)
  self:write_message("Hello World???")
end

M.WSMensaje = WSMensaje
return M