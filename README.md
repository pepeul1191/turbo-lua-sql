# Turbo Lua SQL Boilerplate

Instlación de Turbo:

    $ sudo apt-get install lua5.1 luajit luarocks git build-essential libssl-dev
    $ sudo luarocks install turbo inspect json4lua

Instalación de driver para Sqlite3:

    $ sudo luarocks install luasql-sqlite3

Arrancar la aplicación:

    $ luajit app.lua

Arrancar la aplicación con autoreload ante cambios:

    $ turbovisor app.lua
    $ turbovisor app.lua –ignore static

### Fuentes

+ http://turbo.readthedocs.io/en/latest/get_started.html
+ https://github.com/pepeul1191/lapis-pp
+ http://turbo.readthedocs.io/en/latest/turbovisor.html
+ https://github.com/pepeul1191/sockets
+ https://www.tutorialspoint.com/lua/lua_database_access.htm
+ https://keplerproject.github.io/luasql/
+ https://github.com/kikito/inspect.lua
+ https://realtimelogic.com/ba/doc/en/lua/luasql.html
