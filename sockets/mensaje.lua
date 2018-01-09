local turbo = require("turbo")
local json = require("json")
local inspect = require("inspect")
local WSMensaje = class("WSMensaje", turbo.websocket.WebSocketHandler)
local _conversacion = require("models.conversacion")
local _mensaje = require("models.mensaje")
local chat = require("config.chat")
local M = {}

function WSMensaje:prepare()
  local tipo = self:get_argument("tipo")
  --print(tipo)
end

function WSMensaje:open(msg)
  local rpta = nil
  --local tipo = self:get_argument("tipo")
  local usuario_id_1 = self:get_argument("usuario_id_1")
  local usuario_id_2 = self:get_argument("usuario_id_2")
  local conversacion = _conversacion.existe(usuario_id_2, usuario_id_1)
  if conversacion == 0 then
    local conversacion_id = _conversacion.crear(usuario_id_2, usuario_id_1)
    _mensaje.crear(conversacion_id)
    rpta = json.encode({evento = "open", conversacion_id = conversacion_id})
    chat.entrar(conversacion_id, usuario_id_1, self)
  else
    local mensajes = _mensaje.cargar(conversacion.id)
    rpta = json.encode({evento = "open", conversacion_id = conversacion.id, mensajes = mensajes })
    chat.entrar(conversacion.id, usuario_id_1, self)
  end
  self:write_message(rpta)
end

function WSMensaje:on_message(msg)
  local data = json.decode(msg)
  local usuario_id = data.usuario_id
  local conversacion_id = data.conversacion_id
  local momento = turbo.util.gettimeofday()
  local mensaje = {usuario_id = usuario_id, mensaje = data.mensaje, momento = momento}
  _mensaje.actualizar(conversacion_id, usuario_id, mensaje)
  chat.mandar(conversacion_id, data.mensaje, momento, usuario_id)
end

function WSMensaje:on_close()
  --local usuario_id = self:get_argument("usuario_id")
  --local conversacion_id = data.conversacion_id
  --chat.salir(conversacion_id, usuario_id)
  turbo.log.notice("User disconnected")
end

M.WSMensaje = WSMensaje
return M