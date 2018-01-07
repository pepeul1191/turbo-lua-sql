local turbo = require("turbo")
local json = require("json")
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
  local tipo = self:get_argument("tipo")
  local usuario_id = self:get_argument("usuario_id")
  local empresa_id = self:get_argument("empresa_id")
  local conversacion = _conversacion.existe(empresa_id, usuario_id)
  if conversacion == nil then
    local conversacion_id = _conversacion.crear(empresa_id, usuario_id)
    _mensaje.crear(conversacion_id)
    rpta = json.encode({evento = "open", conversacion_id = conversacion.id}) 
  else
    local mensajes = _mensaje.cargar(conversacion.id)
    rpta = json.encode({evento = "open", conversacion_id = conversacion.id, mensajes = mensajes }) 
  end
  chat.entrar(conversacion.id, usuario_id, self)
  self:write_message(rpta)
end

function WSMensaje:on_message(msg)
  local data = json.decode(msg)
  local usuario_id = self:get_argument("usuario_id")
  local empresa_id = self:get_argument("empresa_id")
  local conversacion_id = data.conversacion_id
  local mensaje = {conversacion_id = conversacion_id, usuario_id = usuario_id, mensaje = data.mensaje, momento = turbo.util.gettimeofday()}
  _mensaje.actualizar(conversacion_id, usuario_id, mensaje)
  self:write_message({evento = "on_message", mensaje = data.mensaje})
end

M.WSMensaje = WSMensaje
return M