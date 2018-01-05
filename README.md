# Turbo Lua Boilerplate

Instlación de Turbo:

    $ sudo apt-get install lua5.1 luajit luarocks git build-essential libssl-dev
    $ sudo luarocks install turbo

Arrancar la aplicación:

    $ luajit app.lua

Arrancar la aplicación con autoreload ante cambios:

    $ tubovisor app.lua
    $ tubovisor app.lua –ignore static


### Fuentes

+ http://turbo.readthedocs.io/en/latest/get_started.html
+ https://github.com/pepeul1191/lapis-pp
+ http://turbo.readthedocs.io/en/latest/turbovisor.html
+ https://github.com/pepeul1191/sockets
+ https://github.com/kernelsauce/turbo/blob/master/examples/chatapp/chatapp.lua