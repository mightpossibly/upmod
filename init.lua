-- Load modfiles
local modpath = minetest.get_modpath("upmod")
dofile(modpath .. "/panes.lua")
dofile(modpath .. "/nodes.lua")
--dofile(modpath .. "/concrete.lua")

-- Replace old upmod-sea_lanters with xocean ones
minetest.register_alias("upmod:sea_lantern", "xocean:sea_lantern")
minetest.register_alias("beds:bed_rainbow", "upmod:bed_rainbow")
minetest.register_alias("beds:bed_black", "upmod:bed_black")
minetest.register_alias("beds:bed_funkysunset", "upmod:bed_funkysunset")
minetest.register_alias("abriglass:stained_glass_light_gray", "abriglass:stained_glass_grey")
minetest.register_alias("abriglass:stained_glass_dark_gray", "abriglass:stained_glass_dark_grey")
minetest.register_alias("abriglass:stained_glass_purple", "abriglass:stained_glass_violet")
minetest.register_alias("abriglass:stained_glass_frosted", "abriglass:stained_glass_white")
minetest.register_alias("abriglass:stained_glass_dark_yellow", "abriglass:stained_glass_brown")