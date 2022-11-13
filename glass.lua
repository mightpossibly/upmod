
function register_pane(name, def)
	for i = 1, 15 do
		minetest.register_alias("xpanes:" .. name .. "_" .. i, "xpanes:" .. name .. "_flat")
	end

	local flatgroups = table.copy(def.groups)
	flatgroups.pane = 1
	minetest.register_node(":xpanes:" .. name .. "_flat", {
		description = def.description,
		drawtype = "nodebox",
		paramtype = "light",
		is_ground_content = false,
		sunlight_propagates = true,
		inventory_image = def.inventory_image,
		wield_image = def.wield_image,
		paramtype2 = "facedir",
		use_texture_alpha = true,
		-- light_source = 4,
		tiles = {def.textures[3], def.textures[3], def.textures[3], def.textures[3], def.textures[1], def.textures[1]}, 
		groups = flatgroups,
		drop = "xpanes:" .. name .. "_flat",
		sounds = def.sounds,
		node_box = {
			type = "fixed",
			fixed = {{-1/2, -1/2, -1/32, 1/2, 1/2, 1/32}},
		},
		selection_box = {
			type = "fixed",
			fixed = {{-1/2, -1/2, -1/32, 1/2, 1/2, 1/32}},
		},
		connect_sides = { "left", "right" },
	})

	local groups = table.copy(def.groups)
	groups.pane = 1
	groups.not_in_creative_inventory = 1
	minetest.register_node(":xpanes:" .. name, {
		drawtype = "nodebox",
		paramtype = "light",
		is_ground_content = false,
		sunlight_propagates = true,
		use_texture_alpha = true,
		light_source = 4,
		description = def.description,
		tiles = {def.textures[3], def.textures[3], def.textures[1]},
		groups = groups,
		drop = "xpanes:" .. name .. "_flat",
		sounds = def.sounds,
		node_box = {
			type = "connected",
			fixed = {{-1/32, -1/2, -1/32, 1/32, 1/2, 1/32}},
			connect_front = {{-1/32, -1/2, -1/2, 1/32, 1/2, -1/32}},
			connect_left = {{-1/2, -1/2, -1/32, -1/32, 1/2, 1/32}},
			connect_back = {{-1/32, -1/2, 1/32, 1/32, 1/2, 1/2}},
			connect_right = {{1/32, -1/2, -1/32, 1/2, 1/2, 1/32}},
		},
		connects_to = {"group:pane", "group:stone", "group:glass", "group:wood", "group:tree"},
	})

	minetest.register_craft({
		output = "xpanes:" .. name .. "_flat 16",
		recipe = def.recipe
	})
end

-- Define Colors
local color_list = {
	{"white",		"White", 		"FFFFFF",},
	{"grey",		"Grey", 		"5A5A5A",},
	{"dark_grey",	"Dark Grey", 	"2A2A2A",},
	{"black",		"Black", 		"000000",},
	{"violet",		"Violet", 		"4D276A",}, 
	{"blue",		"Blue", 		"3E5AAD",},
	{"cyan",		"Cyan",			"517D99",},
	{"dark_green",	"Dark Green", 	"52803B",}, 
	{"green",		"Green", 		"48AD45",},
	{"yellow",		"Yellow", 		"E1E148",},
	{"brown",		"Brown", 		"4F2425",}, 
	{"orange",		"Orange",		"D77D42",},
	{"red",			"Red",			"AF1B27",},
	{"magenta",		"Magenta",		"C750D6",},
	{"pink",		"Pink", 		"EA84AD",},
	{"light_blue",	"Light Blue",	"40A1D6",}
}



-- Register Stained Glass Blocks

for i in ipairs(color_list) do
	local name = color_list[i][1]
	local description = color_list[i][2]
	local colour = color_list[i][3]

	minetest.register_node("upmod:stained_glass_"..name, {
		description = "Stained "..description.." Glass",
		tiles = {"upmod_glass_stained.png^[colorize:#"..colour..":122"},
		groups = {cracky = 3, oddly_breakable_by_hand = 3},
		use_texture_alpha = "blend",
		sunlight_propagates = true,
		light_source = 4,
		drawtype = "glasslike",
		paramtype = "light",
		sounds = default.node_sound_glass_defaults(),
	})

	minetest.register_craft({
		output = "upmod:stained_glass_"..name.." 8",
		recipe = {
			{"default:glass", "default:glass", "default:glass" },
			{"default:glass", "dye:"..name, "default:glass" },
			{"default:glass", "default:glass", "default:glass" },
		}
	})
end

-- Register Glass Panes
for i in ipairs(color_list) do
	local name = color_list[i][1]
	local description = color_list[i][2]
	local colour = color_list[i][3]
	local tex = "upmod_glass_pane.png^[colorize:#"..colour..":122"
	local texedge = "upmod_glass_pane_edge.png^[colorize:#"..colour..":122"

	register_pane("glass_pane_"..name, {
		description = description.." Glass Pane",
		textures = {tex, texedge, texedge},
		groups = {cracky = 3, oddly_breakable_by_hand = 3},
		use_texture_alpha = true,
		wield_image = tex,
		inventory_image = tex,
		sounds = default.node_sound_glass_defaults(),
		recipe = {
			{"default:glass", "default:glass", "default:glass",},
			{"default:glass", "default:glass", "default:glass",},
			{"","dye:"..name,"",},
		}
	})
end

--[[

	minetest.register_craft({
		output = "xpanes:glass_pane"..name.." 8",
		recipe = {
			{"xpanes:pane_flat", "xpanes:pane_flat", "xpanes:pane_flat" },
			{"xpanes:pane_flat", "dye:"..name, "xpanes:pane_flat" },
			{"xpanes:pane_flat", "xpanes:pane_flat", "xpanes:pane_flat" },
		}
	})
			
	minetest.register_craft({
		output = "xpanes:glass_pane"..name.." 16",
		recipe = {
			{"", "", "" },
			{"upmod:stained_glass_"..name, "upmod:stained_glass_"..name, "upmod:stained_glass_"..name },
			{"upmod:stained_glass_"..name, "upmod:stained_glass_"..name, "upmod:stained_glass_"..name },
		}
	})
--]]

-- Backwards compatibility: Replace abriglass with new ones
minetest.register_alias("abriglass:stained_glass_frosted", "upmod:stained_glass_white")
minetest.register_alias("abriglass:stained_glass_white", "upmod:stained_glass_white")
minetest.register_alias("abriglass:stained_glass_grey", "upmod:stained_glass_grey")
minetest.register_alias("abriglass:stained_glass_dark_grey", "upmod:stained_glass_dark_grey")
minetest.register_alias("abriglass:stained_glass_black", "upmod:stained_glass_black")
minetest.register_alias("abriglass:stained_glass_red", "upmod:stained_glass_red")
minetest.register_alias("abriglass:stained_glass_pink", "upmod:stained_glass_pink")
minetest.register_alias("abriglass:stained_glass_yellow", "upmod:stained_glass_yellow")
minetest.register_alias("abriglass:stained_glass_orange", "upmod:stained_glass_orange")
minetest.register_alias("abriglass:stained_glass_brown", "upmod:stained_glass_brown")
minetest.register_alias("abriglass:stained_glass_dark_green", "upmod:stained_glass_dark_green")
minetest.register_alias("abriglass:stained_glass_green", "upmod:stained_glass_green")
minetest.register_alias("abriglass:stained_glass_cyan", "upmod:stained_glass_cyan")
minetest.register_alias("abriglass:stained_glass_light_blue", "upmod:stained_glass_light_blue")
minetest.register_alias("abriglass:stained_glass_blue", "upmod:stained_glass_blue")
minetest.register_alias("abriglass:stained_glass_violet", "upmod:stained_glass_violet")
minetest.register_alias("abriglass:stained_glass_purple", "upmod:stained_glass_violet")
minetest.register_alias("abriglass:stained_glass_magenta", "upmod:stained_glass_magenta")

minetest.register_alias("xpanes:upmod_pane_white", "xpanes:glass_pane_white")
minetest.register_alias("xpanes:upmod_pane_grey", "xpanes:glass_pane_grey")
minetest.register_alias("xpanes:upmod_pane_dark_grey", "xpanes:glass_pane_dark_grey")
minetest.register_alias("xpanes:upmod_pane_black", "xpanes:glass_pane_black")
minetest.register_alias("xpanes:upmod_pane_red", "xpanes:glass_pane_red")
minetest.register_alias("xpanes:upmod_pane_pink", "xpanes:glass_pane_pink")
minetest.register_alias("xpanes:upmod_pane_yellow", "xpanes:glass_pane_yellow")
minetest.register_alias("xpanes:upmod_pane_orange", "xpanes:glass_pane_orange")
minetest.register_alias("xpanes:upmod_pane_brown", "xpanes:glass_pane_brown")
minetest.register_alias("xpanes:upmod_pane_dark_green", "xpanes:glass_pane_dark_green")
minetest.register_alias("xpanes:upmod_pane_green", "xpanes:glass_pane_green")
minetest.register_alias("xpanes:upmod_pane_cyan", "xpanes:glass_pane_cyan")
minetest.register_alias("xpanes:upmod_pane_light_blue", "xpanes:glass_pane_light_blue")
minetest.register_alias("xpanes:upmod_pane_blue", "xpanes:glass_pane_blue")
minetest.register_alias("xpanes:upmod_pane_violet", "xpanes:glass_pane_violet")
minetest.register_alias("xpanes:upmod_pane_magenta", "xpanes:glass_pane_magenta")

minetest.register_alias("xpanes:upmod_pane_frosted_flat", "xpanes:glass_pane_white_flat")
minetest.register_alias("xpanes:upmod_pane_white_flat", "xpanes:glass_pane_white_flat")
minetest.register_alias("xpanes:upmod_pane_grey_flat", "xpanes:glass_pane_grey_flat")
minetest.register_alias("xpanes:upmod_pane_dark_grey_flat", "xpanes:glass_pane_dark_grey_flat")
minetest.register_alias("xpanes:upmod_pane_black_flat", "xpanes:glass_pane_black_flat")
minetest.register_alias("xpanes:upmod_pane_red_flat", "xpanes:glass_pane_red_flat")
minetest.register_alias("xpanes:upmod_pane_pink_flat", "xpanes:glass_pane_pink_flat")
minetest.register_alias("xpanes:upmod_pane_yellow_flat", "xpanes:glass_pane_yellow_flat")
minetest.register_alias("xpanes:upmod_pane_orange_flat", "xpanes:glass_pane_orange_flat")
minetest.register_alias("xpanes:upmod_pane_brown_flat", "xpanes:glass_pane_brown_flat")
minetest.register_alias("xpanes:upmod_pane_dark_green_flat", "xpanes:glass_pane_dark_green_flat")
minetest.register_alias("xpanes:upmod_pane_green_flat", "xpanes:glass_pane_green_flat")
minetest.register_alias("xpanes:upmod_pane_cyan_flat", "xpanes:glass_pane_cyan_flat")
minetest.register_alias("xpanes:upmod_pane_light_blue_flat", "xpanes:glass_pane_light_blue_flat")
minetest.register_alias("xpanes:upmod_pane_blue_flat", "xpanes:glass_pane_blue_flat")
minetest.register_alias("xpanes:upmod_pane_purple_flat", "xpanes:glass_pane_violet_flat")
minetest.register_alias("xpanes:upmod_pane_violet_flat", "xpanes:glass_pane_violet_flat")
minetest.register_alias("xpanes:upmod_pane_magenta_flat", "xpanes:glass_pane_magenta_flat")