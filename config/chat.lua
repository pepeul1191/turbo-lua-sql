local inspect = require("inspect")
local sockets = {}
local M = {}

function entrar(conversacion_id, usuario_id, socket)
  local existe_conversacion = false
  for k, v in pairs(sockets) do
    if k == conversacion_id then
      existe_conversacion = true
      --break
    end
  end
  -- validar que la conversacion no este ya registrada, si en así, actualizar usuarios
  -- falta menjorar 't' en función al json
  --[=====[ 
    {
      "conversacion_id" : conversacion_id
      "usuarios" : [
        {
          "usuario_id" : usuario_id,
          "socket" : socket
        }, ...
      ]
    }
  --]=====]
  local t = {conversacion_id = conversacion_id, socket = socket}
  table.insert(sockets, t)
end

function mandar(conversacion_id, mensaje, momento)
  --TODO
end

function salir(conversacion_id, usuario_id)
  --TODO
end

M.registrar = registrar
M.mandar = mandar
M.salir = salir
return M