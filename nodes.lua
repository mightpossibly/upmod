-- White Lamp
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

-- Colored Sea Lanterns
minetest.register_node("upmod:red_sea_lantern", {
		description = "Red Sea Lantern",
		tiles = {"upmod_red_sea_lantern.png"},
		groups = {cracky = 3},
		sunlight_propagates = true,
		is_ground_content = false,
		groups = {cracky = 3, oddly_breakable_by_hand = 3, },
		sounds = default.node_sound_glass_defaults(),
			light_source = default.LIGHT_MAX,
	})

minetest.register_node("upmod:green_sea_lantern", {
		description = "Green Sea Lantern",
		tiles = {"upmod_green_sea_lantern.png"},
		groups = {cracky = 3},
		sunlight_propagates = true,
		is_ground_content = false,
		groups = {cracky = 3, oddly_breakable_by_hand = 3, },
		sounds = default.node_sound_glass_defaults(),
			light_source = default.LIGHT_MAX,
	})

minetest.register_node("upmod:purple_sea_lantern", {
		description = "Purple Sea Lantern",
		tiles = {"upmod_purple_sea_lantern.png"},
		groups = {cracky = 3},
		sunlight_propagates = true,
		is_ground_content = false,
		groups = {cracky = 3, oddly_breakable_by_hand = 3, },
		sounds = default.node_sound_glass_defaults(),
			light_source = default.LIGHT_MAX,
	})

minetest.register_node("upmod:blue_sea_lantern", {
		description = "Blue Sea Lantern",
		tiles = {"upmod_blue_sea_lantern.png"},
		groups = {cracky = 3},
		sunlight_propagates = true,
		is_ground_content = false,
		groups = {cracky = 3, oddly_breakable_by_hand = 3, },
		sounds = default.node_sound_glass_defaults(),
			light_source = default.LIGHT_MAX,
	})
	
minetest.register_node("upmod:yellow_sea_lantern", {
		description = "Yellow Sea Lantern",
		tiles = {"upmod_yellow_sea_lantern.png"},
		groups = {cracky = 3},
		sunlight_propagates = true,
		is_ground_content = false,
		groups = {cracky = 3, oddly_breakable_by_hand = 3, },
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

-- Add Stairs & Slabs
stairs.register_stair_and_slab("smooth_desert_sandstone", "upmod:smooth_desert_sandstone",
   {cracky=2},
   {"upmod_smooth_desert_sandstone.png" },
   ("Smooth Desert Sandstone Stair"),
   ("Smooth Desert Sandstone Slab"),
   default.node_sound_stone_defaults())
   
   stairs.register_stair_and_slab("smooth_quartz", "upmod:smooth_quartz",
   {cracky=2},
   {"upmod_smooth_quartz.png" },
   ("Smooth Quartz Stair"),
   ("Smooth Quartz Slab"),
   default.node_sound_stone_defaults())
   
   stairs.register_stair_and_slab("smooth_sandstone", "upmod:smooth_sandstone",
   {cracky=2},
   {"upmod_smooth_sandstone.png" },
   ("Smooth Sandstone Stair"),
   ("Smooth Sandstone Slab"),
   default.node_sound_stone_defaults())

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