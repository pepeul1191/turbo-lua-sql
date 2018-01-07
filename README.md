# Turbo Lua Boilerplate

Instlación de Turbo:

    $ sudo apt-get install lua5.1 luajit luarocks git build-essential libssl-dev
    $ sudo luarocks install turbo inspect

Instalación de driver para RethinkDB:

    $ sudo luarocks install lua-reql

Arrancar la aplicación:

    $ luajit app.lua

Arrancar la aplicación con autoreload ante cambios:

    $ turbovisor app.lua
    $ turbovisor app.lua –ignore static

Contar la longitud de una tabla

    local count = 0
    for _ in pairs(sockets) do count = count + 1 end

### Fuentes

+ http://turbo.readthedocs.io/en/latest/get_started.html
+ https://github.com/pepeul1191/lapis-pp
+ http://turbo.readthedocs.io/en/latest/turbovisor.html
+ https://github.com/pepeul1191/sockets
+ https://github.com/kernelsauce/turbo/blob/master/examples/chatapp/chatapp.lua
+ https://github.com/grandquista/Lua-ReQL/wiki/index
+ https://github.com/kikito/inspect.lua