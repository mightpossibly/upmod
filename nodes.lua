-- White Lamp
minetest.register_node("upmod:white_lamp", {
	description = "White Lamp",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"upmod_white_lamp.png"},
	is_ground_content = false,
	drawtype = "glasslike",
	sunlight_propagates = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
	light_source = default.LIGHT_MAX,
})

-- Ice
minetest.register_node(":default:ice", {
	description = ("Ice"),
	tiles = {"upmod_ice.png"},
	use_texture_alpha = "blend",
	sunlight_propagates = true,
	is_ground_content = true,
	paramtype = "light",
	drawtype = "glasslike",
	groups = {oddly_breakable_by_hand = 3, cracky = 3, cools_lava = 1, slippery = 7},
	sounds = default.node_sound_ice_defaults(),
})

minetest.register_node("upmod:packed_ice", {
	description = ("Packed Ice"),
	tiles = {"upmod_ice_packed.png"},
	use_texture_alpha = "blend",
	sunlight_propagates = true,
	is_ground_content = true,
	paramtype = "light",
	drawtype = "glasslike",
	groups = {cracky = 3, cools_lava = 1, slippery = 7},
	sounds = default.node_sound_ice_defaults(),
})
minetest.register_alias("upmod:ice_packed", "upmod:packed_ice")

minetest.register_node("upmod:black_ice", {
	description = ("Black Ice"),
	tiles = {"upmod_ice_black.png"},
	use_texture_alpha = "blend",
	sunlight_propagates = true,
	is_ground_content = true,
	paramtype = "light",
	drawtype = "glasslike",
	groups = {cracky = 3, cools_lava = 1, slippery = 16},
	sounds = default.node_sound_ice_defaults(),
})

minetest.register_alias("upmod:dark_ice", "upmod:black_ice")
minetest.register_alias("upmod:ice_black", "upmod:black_ice")


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
	use_texture_alpha = "clip",
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
	description = ("Rainbow Bed"),
	inventory_image = "upmod_bed_inv_rainbow.png",
	wield_image = "upmod_bed_rainbow.png",
	tiles = {"upmod_bed_rainbow.png"},
	mesh = "beds_simple_bed.obj",
	selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
	collisionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
	recipe = {
		{"wool:red", "wool:blue", "wool:yellow"},
		{"group:wood", "group:wood", "group:wood"}
	},
})

beds.register_bed("upmod:bed_funkysunset", {
	description = ("Funky Sunset Bed"),
	inventory_image = "upmod_bed_inv_funkysunset.png",
	wield_image = "upmod_bed_inv_funkysunset.png",
	tiles = {"upmod_bed_funkysunset.png"},
	mesh = "beds_simple_bed.obj",
	selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
	collisionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
	recipe = {
		{"wool:orange", "wool:orange", "wool:orange"},
		{"group:wood", "group:wood", "group:wood"}
	}
})

beds.register_bed("upmod:bed_black", {
	description = ("Black Bed"),
	inventory_image = "upmod_bed_inv_black.png",
	wield_image = "upmod_bed_inv_black.png",
	tiles = {"upmod_bed_black.png"},
	mesh = "beds_simple_bed.obj",
	selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
	collisionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
	recipe = {
		{"wool:black", "wool:black", "wool:black"},
		{"group:wood", "group:wood", "group:wood"}
	}
})

