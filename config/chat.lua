local json = require("json")
local inspect = require("inspect")
local utils = require("config.utils")
local sockets = {}
local M = {}
--[=====[ 
  sockets = 
  {
    "conversacion_id" :  
    [
      {
        "usuario_id" : usuario_id,
        "socket" : socket
      }, ...
    ]
  }
--]=====]
function entrar(conversacion_id, usuario_id, socket)
  -- validar que la conversacion no este ya registrada, si en así, actualizar usuarios
  if utils.has_key(sockets, conversacion_id) then
    local conversacion = sockets[conversacion_id]
    local existe_usuario = false
    for i = 1, utils.count(conversacion) do
      if conversacion[i]["usuario_id"] == usuario_id then
        existe_usuario = true
      end
    end
    if existe_usuario == false then
      local t = {{usuario_id = usuario_id, socket = socket}}
      table.insert(conversacion, t)
      sockets[conversacion_id] = conversacion
    end
  else
    local conversacion = {{usuario_id = usuario_id, socket = socket}}
    sockets[conversacion_id] = conversacion
  end
end

function mandar(conversacion_id, mensaje, momento)
  local conversacion = sockets[conversacion_id]
  for i = 1, utils.count(conversacion) do
    socket = conversacion[i]["socket"]
    local data = json.encode({evento = "on_message", mensaje = mensaje})
    socket:write_message(data)
  end
end

function salir(conversacion_id, usuario_id)
  if utils.has_key(sockets, conversacion_id) then
    local conversacion = sockets[conversacion_id]
    local existe_usuario = false
    for i = 1, utils.count(conversacion) do
      if conversacion[i]["usuario_id"] == usuario_id then
        existe_usuario = true
      end
    end
    local conversacion_actualizada = {}
    if existe_usuario == true then
      for i = 1, utils.count(conversacion) do
        if conversacion[i]["usuario_id"] ~= usuario_id then
          table.insert(conversacion_actualizada, conversacion)
        end
      end
      sockets[conversacion_id] = conversacion_actualizada
    end
  end
end

M.entrar = entrar
M.mandar = mandar
M.salir = salir
return M