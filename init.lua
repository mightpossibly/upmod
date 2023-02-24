-- Load modfiles
local modpath = minetest.get_modpath("upmod")

dofile(modpath .. "/nodes.lua")
dofile(modpath .. "/glass.lua")
dofile(modpath .. "/concrete.lua")
dofile(modpath .. "/smoothstones.lua")
dofile(modpath .. "/sea_lanterns.lua")
dofile(modpath .. "/doors.lua")
dofile(modpath .. "/overrides.lua")

-- Misc. aliases
--minetest.register_alias("upmod:sea_lantern", "xocean:sea_lantern")

-- Dig/place distance (default is 4)
--minetest.override_item("", {range = 5,})
	
-- "Upmod loaded" message
print("[upmod] loaded")

minetest.register_alias("moreblocks:grey_bricks", "moreblocks:stone_tile")
minetest.register_alias("moreblocks:circle_stone_bricks", "moreblocks:stone_tile")
minetest.register_alias("moreblocks:split_stone_tile", "moreblocks:stone_tile")
minetest.register_alias("moreblocks:checker_stone_tile", "moreblocks:stone_tile")
minetest.register_alias("moreblocks:moreblocks:iron_checker", "moreblocks:stone_tile")
--minetest.register_alias("moreblocks:", "moreblocks:stone_tile")


minetest.register_alias_force("moretrees:palm_trunk", "ethereal:palm_trunk")
