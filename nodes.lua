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
-- OCEAN STUFF
---------------------------
-- Ocean stone aka prismarine (xocean supplements)
minetest.register_node("upmod:dark_ocean_stone", {
	description = "Dark Ocean Stone",
	tiles = {"upmod_dark_ocean_stone.png"},
	is_ground_content = false,
	groups = {cracky = 2},
})

-- Register items; Shards and crystal
minetest.register_craftitem("upmod:ocean_shard", {
	description = "Ocean Shard",
	inventory_image = "upmod_ocean_shard.png",
})

minetest.register_craftitem("upmod:ocean_crystals", {
	description = "Ocean Crystals",
	inventory_image = "upmod_ocean_crystals.png",
})

-- Register crafting recipes
minetest.register_craft({
    type = "shaped",
    output = "upmod:dark_ocean_stone",
    recipe = {
        {"upmod:ocean_shard",	"upmod:ocean_shard",	"upmod:ocean_shard"},
        {"upmod:ocean_shard",	"dye:black",	"upmod:ocean_shard"},
		{"upmod:ocean_shard",	"upmod:ocean_shard",	"upmod:ocean_shard"}
    }
})

minetest.register_craft({
    type = "shaped",
    output = "xocean:sea_lantern",
    recipe = {
        {"upmod:ocean_shard",	"upmod:ocean_crystals",	"upmod:ocean_shard"},
        {"upmod:ocean_crystals",	"upmod:ocean_crystals",	"upmod:ocean_crystals"},
		{"upmod:ocean_shard",	"upmod:ocean_crystals",	"upmod:ocean_shard"}
    }
})

minetest.register_craft({
    type = "shaped",
    output = "xocean:ocean_cobble",
        recipe = {
        {"", "", ""},
        {"upmod:ocean_shard", "upmod:ocean_shard",  ""},
        {"upmod:ocean_shard", "upmod:ocean_shard",  ""},
    }
})

minetest.register_craft({
    type = "shapeless",
    output = "xocean:ocean_carved",
    recipe = {
        "upmod:ocean_shard","upmod:ocean_shard","upmod:ocean_shard",
        "upmod:ocean_shard","upmod:ocean_shard","upmod:ocean_shard",
		"upmod:ocean_shard","upmod:ocean_shard","upmod:ocean_shard",
    },
})


minetest.register_node("upmod:selector_demo", {
	description = "Selector (demo node)",
	paramtype2 = "facedir",
	tiles = {
		"atm_top.png", "atm_top.png",
		"atm_side.png", "atm_side.png",
		"atm_side.png",
			{
			image = "upmod_selector.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 1.5
			},
		}
	},
	is_ground_content = false,
	groups = {cracky=2, bank_equipment = 3},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
})


beds.register_bed("upmod:bed_rainbow", {
	description = ("Simple Rainbow Bed"),
	inventory_image = "beds_bed_rainbow.png",
	wield_image = "beds_bed_rainbow.png",
	tiles = {"beds_simple_bed_rainbow.png"},
	mesh = "beds_simple_bed.obj",
	selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
	collisionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
	recipe = {
		{"wool:red", "wool:blue", "wool:yellow"},
		{"group:wood", "group:wood", "group:wood"}
	},
})

beds.register_bed("upmod:bed_funkysunset", {
	description = ("Simple Funky Sunset Bed"),
	inventory_image = "beds_bed_funkysunset.png",
	wield_image = "beds_bed_funkysunset.png",
	tiles = {"beds_simple_bed_funkysunset.png"},
	mesh = "beds_simple_bed.obj",
	selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
	collisionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
	recipe = {
		{"wool:orange", "wool:orange", "wool:orange"},
		{"group:wood", "group:wood", "group:wood"}
	}
})

beds.register_bed("upmod:bed_black", {
	description = ("Simple Black Bed"),
	inventory_image = "beds_bed_black.png",
	wield_image = "beds_bed_black.png",
	tiles = {"beds_simple_bed_black.png"},
	mesh = "beds_simple_bed.obj",
	selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
	collisionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
	recipe = {
		{"wool:black", "wool:black", "wool:black"},
		{"group:wood", "group:wood", "group:wood"}
	}
})

