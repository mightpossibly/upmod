-- Load modfiles
local modpath = minetest.get_modpath("upmod")
dofile(modpath .. "/panes.lua")
dofile(modpath .. "/nodes.lua")

-- Replace old upmod-sea_lanters with xocean ones
minetest.register_alias("upmod:sea_lantern", "xocean:sea_lantern")