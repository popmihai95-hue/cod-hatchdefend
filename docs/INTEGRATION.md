# HatchDefend 2.0 integration

## Existing project audit (uploaded HatchDefend.rbxlx)
The uploaded place contains 5 ModuleScripts (EggConfig, ShopConfig, DefenseConfig, SoundConfig, ZoneConfig), 2 server Scripts (GameServer, WorldSetup), and 1 LocalScript (GameClient). The server and client scripts are large and should be reviewed before refactoring. The place file itself is not yet stored in this GitHub repository.

## Safe visual preview
1. Back up the original Roblox Studio place.
2. Create a Script in ServerScriptService and paste `src/ServerScriptService/VisualUpgrade.server.luau`.
3. Create a LocalScript in StarterPlayer > StarterPlayerScripts and paste `src/StarterPlayer/StarterPlayerScripts/VisualPolish.client.luau`.
4. The UI polish script intentionally changes only buttons whose names begin with `HD2_`. Existing buttons are untouched until explicitly opted in.
5. Playtest on desktop and mobile. Tune Lighting settings for your game's art direction.
6. Disable both scripts to revert. Restore previous Lighting values from your backup if needed.

## Next milestone
Export the original place's Lua sources into the matching service directories. Preserve all existing RemoteEvents and game logic. Review server-side validation of hatch purchases, damage and rewards before introducing new gameplay.
