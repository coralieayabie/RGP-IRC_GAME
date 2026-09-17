#!/bin/bash

# Set up environment for RPG IRC Bot
cd "$(dirname "$0")"

# Set Lua paths
export LUA_PATH="./modules/?.lua;./modules/irc/?.lua;./?/init.lua;./irce/?.lua;./irce/modules/?.lua;./luasocket/src/?.lua;;"
export LUA_CPATH="./luasocket/?.so;;"

# Run the bot
./lua main.lua
