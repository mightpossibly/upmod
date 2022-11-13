
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

local panes_list = {
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

for i in ipairs(panes_list) do
	local name = panes_list[i][1]
	local description = panes_list[i][2]
	local colour = panes_list[i][3]
	local tex = "upmod_plainglass.png^[colorize:#"..colour..":35"
	local texedge = "upmod_glassedge.png^[colorize:#"..colour..":35"

	register_pane("upmod_pane_"..name, {
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
