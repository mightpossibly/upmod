minetest.register_node("upmod:white_lamp", {
	description = "White Lamp",
	paramtype2 = "facedir",
	use_texture_alpha = true,
	place_param2 = 0,
	tiles = {"upmod_white_lamp.png"},
	is_ground_content = false,
	drawtype = "glasslike",
	sunlight_propagates = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
	light_source = default.LIGHT_MAX,
})


-- Smooth variants of various stone blocks
minetest.register_node("upmod:smooth_desert_sandstone", {
	description = "Smooth Desert Sandstone",
	tiles = {"upmod_smooth_desert_sandstone.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("upmod:smooth_quartz", {
	description = "Smooth Quartz",
	tiles = {"upmod_smooth_quartz.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("upmod:smooth_sandstone", {
	description = "Smooth Sandstone",
	tiles = {"upmod_smooth_sandstone.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

-- Furnace Recipes for the smooth stones
minetest.register_craft({
	type = "cooking",
	output = "upmod:smooth_desert_sandstone",
	recipe = "default:desert_sandstone",
	cooktime = 10,
})
minetest.register_craft({
	type = "cooking",
	output = "upmod:smooth_sandstone",
	recipe = "default:sandstone",
	cooktime = 10,
})
minetest.register_craft({
	type = "cooking",
	output = "upmod:smooth_quartz",
	recipe = "quartz:block",
	cooktime = 10,
})

-- Iron Bar Floor
minetest.register_node("upmod:iron_bar_floor", {
	description = "Iron Bars (floor)",
	tiles = {
		"upmod_iron_bar_floor.png",
		"upmod_iron_bar_floor.png",
		"blank.png",
		"blank.png",
		"blank.png",
		"blank.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {cracky = 1, stone = 2},	
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.130000, -0.5, 0.5, 0.220000, 0.5}, -- NodeBox1
		}
	}
})