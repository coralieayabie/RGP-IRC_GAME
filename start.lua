-- Set up package paths for all dependencies
package.path = package.path .. ";./modules/?.lua;./modules/irc/?.lua;./?/init.lua;./irce/?.lua;./irce/modules/?.lua;./luasocket/src/?.lua"
package.cpath = package.cpath .. ";./luasocket/?.so"

-- Load and run main
require("main")
