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

minetest.register_node("upmod:magenta_sea_lantern", {
		description = "Magenta Sea Lantern",
		tiles = {"upmod_magenta_sea_lantern.png"},
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
	
-- Crafting recipes for Colored Sea Lanterns
minetest.register_craft({
    type = "shapeless",
    output = "upmod:red_sea_lantern",
    recipe = {
        "xocean:sea_lantern",
        "dye:red",
    },
})
minetest.register_craft({
    type = "shapeless",
    output = "upmod:green_sea_lantern",
    recipe = {
        "xocean:sea_lantern",
        "dye:green",
    },
})
minetest.register_craft({
    type = "shapeless",
    output = "upmod:magenta_sea_lantern",
    recipe = {
        "xocean:sea_lantern",
        "dye:magenta",
    },
})
minetest.register_craft({
    type = "shapeless",
    output = "upmod:blue_sea_lantern",
    recipe = {
        "xocean:sea_lantern",
        "dye:blue",
    },
})
minetest.register_craft({
    type = "shapeless",
    output = "upmod:yellow_sea_lantern",
    recipe = {
        "xocean:sea_lantern",
        "dye:yellow",
    },
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

-- Ice
minetest.register_node("upmod:packed_ice", {
	description = ("Packed Ice"),
	tiles = {"upmod_packed_ice.png"},
	is_ground_content = false,
	paramtype = "light",
	groups = {cracky = 3, cools_lava = 1, slippery = 7},
	sounds = default.node_sound_ice_defaults(),
})

minetest.register_node("upmod:dark_ice", {
	description = ("Dark Ice"),
	tiles = {"upmod_dark_ice.png"},
	is_ground_content = false,
	paramtype = "light",
	groups = {cracky = 3, cools_lava = 1, slippery = 16},
	sounds = default.node_sound_ice_defaults(),
})

minetest.register_craft({
    type = "shapeless",
    output = "upmod:packed_ice",
    recipe = {
        "default:ice","default:ice","default:ice",
        "default:ice","default:ice","default:ice",
		"default:ice","default:ice","default:ice",
    },
})

minetest.register_craft({
    type = "shapeless",
    output = "upmod:dark_ice",
    recipe = {
        "upmod:packed_ice","upmod:packed_ice","upmod:packed_ice",
        "upmod:packed_ice","upmod:packed_ice","upmod:packed_ice",
		"upmod:packed_ice","upmod:packed_ice","upmod:packed_ice",
    },
})

minetest.register_craft({
    type = "shapeless",
    output = "default:ice 9",
    recipe = {
	"upmod:packed_ice",
    },
})

minetest.register_craft({
    type = "shapeless",
    output = "upmod:packed_ice 9",
    recipe = {
	"upmod:dark_ice",
    },
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

-- Ocean stone aka prismarine
minetest.register_node("upmod:dark_ocean_stone", {
	description = "Dark Ocean Stone",
	tiles = {"upmod_dark_ocean_stone.png"},
	is_ground_content = false,
	groups = {cracky = 2},
})