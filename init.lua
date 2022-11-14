-- Load modfiles
local modpath = minetest.get_modpath("upmod")

dofile(modpath .. "/nodes.lua")
dofile(modpath .. "/glass.lua")
dofile(modpath .. "/concrete.lua")
dofile(modpath .. "/smoothstones.lua")
dofile(modpath .. "/sea_lanterns.lua")

-- Misc. aliases
minetest.register_alias("upmod:sea_lantern", "xocean:sea_lantern")

-- "Upmod loaded" message
print("[upmod] loaded")