local turbo = require("turbo")
local json = require("json")
local WSMensaje = class("WSMensaje", turbo.websocket.WebSocketHandler)
local _conversacion = require("models.conversacion")
local _mensaje = require("models.mensaje")
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
    rpta = _mensaje.crear(conversacion_id)
  else
    local mensajes = _mensaje.cargar(conversacion.id)
    rpta = json.encode(mensajes) 
  end
  self:write_message(rpta)
end

function WSMensaje:on_message(msg)
  local tipo = self:get_argument("tipo")
  print(tipo)
  self:write_message("Hello World???")
end

M.WSMensaje = WSMensaje
return M