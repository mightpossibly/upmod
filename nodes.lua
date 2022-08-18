minetest.register_node("upmod:sea_lantern", {
	description = "Sea Lantern",
	paramtype2 = "facedir",
	use_texture_alpha = true,
	place_param2 = 0,
	tiles = {"upmod_sealantern.png"},
	is_ground_content = false,
	drawtype = "glasslike",
	sunlight_propagates = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
	light_source = default.LIGHT_MAX,
})

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

minetest.register_node("upmod:nether_bricks", {
	description = "Nether Bricks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"upmod_nether_bricks.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})