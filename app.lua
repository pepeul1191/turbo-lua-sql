_G.TURBO_SSL = true
local turbo = require("turbo")
local chat = require("config.chat_room")
local HandlerHello = require("handlers.hello")
local HandlerHome = require("handlers.home")
local HandlerMensaje = require("handlers.mensaje")

local app = turbo.web.Application:new(
  {
    {"/$", HandlerHome.Index},
    {"/static/(.*)$", turbo.web.StaticFileHandler, "static/"},
    {"/hello", HandlerHello.Index},
    {"^/mensaje$", HandlerMensaje.WSMensaje, {chatroom = chat.ChatRoom}},
  },
  {
    cookie_secret = "akofdkapokfposakfdsafasdåpfkadåpf"
  }
)

app:listen(8888)
turbo.ioloop.instance():start()