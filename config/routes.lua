local turbo = require("turbo")
local chat = require("config.chat_room")
-- handlers
local HandlerHello = require("handlers.hello")
local HandlerHome = require("handlers.home")
local HandlerMensaje = require("handlers.mensaje")
-- sockets
local SocketMensaje = require("sockets.mensaje")
-- rutas
local routes = {
  {"/$", HandlerHome.Index},
  {"/static/(.*)$", turbo.web.StaticFileHandler, "static/"},
  {"/hello", HandlerHello.Index},
  {"/mensaje", HandlerMensaje.Index},
  {"^/ws-mensaje$", SocketMensaje.WSMensajes, {chatroom = chat.ChatRoom}},
}

local M = {}
M.routes = routes
return M