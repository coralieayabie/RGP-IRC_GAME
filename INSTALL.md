# Installation Guide for RPG IRC Bot

This document describes the installation process for the RPG IRC Bot on a Debian-based system.

## Prerequisites

The bot requires:
- Lua 5.1 interpreter
- LuaSocket library (for networking)
- Lua IRC Engine (for IRC protocol)
- LuaFileSystem (optional, for file operations)

## Quick Start

The repository already includes all necessary dependencies:
- `./lua` - Lua 5.1.5 interpreter
- `./irce/` - IRC protocol library (Lua IRC Engine)
- `./luasocket/` - Networking library (includes .so files)

### Run the bot

To start the bot, use the provided start script:

```bash
cd /path/to/RGP-IRC_GAME
./lua start.lua
```

Or run main.lua directly with proper paths:

```bash
cd /path/to/RGP-IRC_GAME
LUA_PATH="./modules/?.lua;./modules/irc/?.lua;./?/init.lua;./irce/?.lua;./irce/modules/?.lua;./luasocket/src/?.lua;;" \
LUA_CPATH="./luasocket/?.so;;" \
./lua main.lua
```

### Run local tests

To test character and monster creation without connecting to IRC:

```bash
./lua test_local.lua
```

## Configuration

Edit `config.lua` to set your IRC server details:

```lua
config.irc = {
    server = "irc.yourserver.com",
    port = 6667,
    nickname = "RPG_Bot_GameMaster",
    default_channel = "#your-channel"
}
```

## Troubleshooting

### "module not found" errors

If you see errors like `module 'socket' not found` or `module 'irce' not found`:
1. Verify that the LUA_PATH and LUA_CPATH environment variables are set correctly
2. Check that all files are in place in the `lua-irc-engine/` and `luasocket/` directories

### Connection issues

If the bot cannot connect to the IRC server:
1. Check your internet connection
2. Verify the server address and port in `config.lua`
3. Check if the server allows bot connections
4. Try increasing the connection timeout in `config.lua`

## File Structure

```
RGP-IRC_GAME/
├── lua                    # Lua 5.1.5 interpreter
├── irce/                 # IRC protocol library (Lua IRC Engine)
│   ├── init.lua          # Main IRC engine module
│   ├── util.lua
│   └── modules/          # IRC modules (base, channel, message, motd)
├── lua-irc-engine/       # Original Lua IRC Engine repository (git clone)
│   ├── init.lua
│   ├── util.lua
│   └── modules/
├── luasocket/            # Networking library
│   ├── src/              # Lua source files
│   ├── socket/           # Binary socket modules (.so files)
│   ├── lfs.so            # LuaFileSystem binary
│   └── ...
├── modules/              # Bot game modules
│   ├── character.lua
│   ├── character_classes.lua
│   ├── character_xml.lua
│   ├── dice.lua
│   ├── monster_creation.lua
│   └── irc/
│       └── bot.lua
├── config.lua            # Configuration file
├── main.lua              # Entry point
├── start.lua             # Start script with pre-configured paths
└── test_local.lua        # Local testing without IRC connection
```

## Manual Installation (if needed)

If you need to reinstall dependencies manually:

### On Debian/Ubuntu:

```bash
# Install Lua 5.1
apt-get install lua5.1

# Install LuaSocket and LuaFileSystem
apt-get install lua-socket lua-filesystem

# Clone Lua IRC Engine
git clone https://github.com/mirrexagon/lua-irc-engine.git
```

Then copy the files to the appropriate locations in the project directory.

## Notes

- The bot uses French names for some classes (e.g., "phenix" instead of "phoenix", "loup_garou" instead of "werewolf")
- Character classes in the bot: human, mage, elf, dwarf, orc, troll, hobbit
- Monster classes: phenix, vampire, loup_garou, licorne, kraken, minotaure
