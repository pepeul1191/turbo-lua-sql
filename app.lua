_G.TURBO_SSL = true
local turbo = require("turbo")
local chat = require("config.chat_room")
local handlerHome = require("handlers.home")
local handlerMensaje = require("handlers.mensaje")

local HelloWorldHandler = class("HelloWorldHandler", turbo.web.RequestHandler)
function HelloWorldHandler:get()
  self:write("Hello World!")
end

local app = turbo.web.Application:new(
  {
    {"/$", handlerHome.Index},
    {"/static/(.*)$", turbo.web.StaticFileHandler, "static/"},
    {"/hello", HelloWorldHandler},
    {"^/mensaje$", handlerMensaje.WSMensaje, {chatroom = chat.ChatRoom}},
  },
  {
    cookie_secret = "akofdkapokfposakfdsafasdåpfkadåpf"
  }
)

app:listen(8888)
turbo.ioloop.instance():start()