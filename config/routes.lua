local turbo = require("turbo")
-- handlers
local HandlerHello = require("handlers.hello")
local HandlerHome = require("handlers.home")
local HandlerMensaje = require("handlers.mensaje")
-- sockets
local SocketMensaje = require("sockets.mensaje")
-- chat
local chat = require("config.chat_room")
-- rutas
local routes = {
  {"^/$", HandlerHome.Index},
  {"^/static/(.*)$", turbo.web.StaticFileHandler, "static/"},
  {"^/hello", HandlerHello.Index},
  {"^/mensaje", HandlerMensaje.Index},
  {"^/ws/mensaje", SocketMensaje.WSMensaje, {chatroom = chat.ChatRoom}},
}
local M = {}

M.routes = routes
return M