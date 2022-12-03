-- Wood types that already have doors; default:wood and ethereal:sakura_wood

local wood_types = {
	{"Jungle Tree",	"default:junglewood", 			"junglewood",},
	{"Pine",		"default:pine_wood", 			"pine",},
	{"Aspen",		"default:aspen_wood", 			"aspen",},
	{"Acacia",		"default:acacia_wood", 			"acacia",},
	{"Apple Tree",	"moretrees:apple_tree_planks", 	"apple_tree",},
	{"Birch",		"ethereal:birch_wood", 			"birch",},
	{"Cedar",		"moretrees:cedar_planks", 		"cedar",},
	{"Date Palm",	"moretrees:date_palm_planks",	"date_palm",},
	{"Douglas Fir",	"moretrees:fir_planks", 		"fir",},
	{"Oak",			"moretrees:oak_planks", 		"oak",},
	{"Poplar",		"moretrees:poplar_planks", 		"poplar",},
	{"Rubber Tree",	"moretrees:rubber_tree_planks",	"rubber_tree",},
	{"Spruce",		"moretrees:spruce_planks", 		"spruce",},
	{"Palm Tree",	"ethereal:palm_wood", 			"palm",},
	{"Willow",		"ethereal:willow_wood", 		"willow",},
	{"Banana Tree",	"ethereal:banana_wood", 		"banana",},
	{"Olive Tree",	"ethereal:olive_wood", 			"olive",},
	{"Redwood",		"ethereal:red_wood", 			"redwood",},
	{"Frost Tree",	"ethereal:frost_wood", 			"frost",},
	{"Healing Tree","ethereal:yellow_wood", 		"yellow",}
}

for i in ipairs(wood_types) do
	local desc = wood_types[i][1]
	local craft = wood_types[i][2]
	local name = wood_types[i][3]

	doors.register("upmod:door_"..name, {
		tiles = {
			{name = "door_"..name..".png", backface_culling = true}
		},
		description = (desc.." Door"),
		inventory_image = "door_item_"..name..".png",
		groups = {snappy = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		sound_open = "doors_glass_door_open",
		sound_close = "doors_glass_door_close",
		recipe = {
			{craft, craft},
			{craft, craft},
			{craft, craft}
		}
	})
	
	minetest.register_alias("upmod:door_red", "upmod:door_redwood")
	minetest.register_alias("upmod:door_red_a", "upmod:door_redwood_a")
	minetest.register_alias("upmod:door_red_b", "upmod:door_redwood_b")
	
	minetest.register_alias("upmod:door_jungle", "upmod:door_junglewood")
	minetest.register_alias("upmod:door_jungle_a", "upmod:door_junglewood_a")
	minetest.register_alias("upmod:door_jungle_b", "upmod:door_junglewood_b")
	
	doors.register_trapdoor("upmod:trapdoor_"..name, {
		tiles = {
			{name = "upmod:trapdoor_"..name..".png", backface_culling = true}
		},
		description = (desc.." Trapdoor"),
	inventory_image = "upmod_trapdoor_"..name..".png",
	wield_image = "upmod_trapdoor_"..name..".png",
	tile_front = "upmod_trapdoor_"..name..".png",
	tile_side = "upmod_trapdoor_"..name.."_side.png",
	gain_open = 0.06,
	gain_close = 0.13,
		groups = {snappy = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		sound_open = "doors_glass_door_open",
		sound_close = "doors_glass_door_close",
	})
end



-- Override ethereal:sakura_door
doors.register(":ethereal:door_sakura", {
		tiles = {
			{name = "ethereal_sakura_door.png", backface_culling = true}
		},
		description = ("Sakura Wood Door"),
		inventory_image = "ethereal_sakura_door_inv.png",
		groups = {snappy = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		sound_open = "doors_glass_door_open",
		sound_close = "doors_glass_door_close",
		recipe = {
			{"ethereal:sakura_wood", "ethereal:sakura_wood"},
			{"ethereal:sakura_wood", "ethereal:sakura_wood"},
			{"ethereal:sakura_wood", "ethereal:sakura_wood"}
		}
	})

-- Add Bamboo Door (paper door)

doors.register("upmod:door_bamboo", {
		tiles = {
			{name = "door_bamboo.png", backface_culling = true}
		},
		description = ("Bamboo Door"),
		inventory_image = "door_item_bamboo.png",
		groups = {snappy = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		sound_open = "doors_glass_door_open",
		sound_close = "doors_glass_door_close",
		recipe = {
			{"group:stick", "default:paper"},
			{"default:paper", "group:stick"},
			{"ethereal:bamboo_block", "ethereal:bamboo_block"}
		}
	})
	
doors.register_trapdoor("upmod:trapdoor_bamboo", {
		tiles = {
			{name = "ethereal_paper_wall.png", backface_culling = true}
		},
		description = ("Bamboo Trapdoor"),
	inventory_image = "ethereal_paper_wall.png",
	wield_image = "ethereal_paper_wall.png",
	tile_front = "ethereal_paper_wall.png",
	tile_side = "ethereal_paper_wall.png",
	gain_open = 0.06,
	gain_close = 0.13,
		groups = {snappy = 1, choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
		sound_open = "doors_glass_door_open",
		sound_close = "doors_glass_door_close",
		recipe = {
			{"group:stick", "default:paper"},
			{"default:paper", "group:stick"},
			{"ethereal:bamboo_block", "group:stick"}
		}
	})
	
	doors.register_trapdoor("upmod:trapdoor_sakura", {
		tiles = {
			{name = "upmod_trapdoor_sakura.png", backface_culling = true}
		},
		description = ("Sakura Trapdoor"),
	inventory_image = "upmod_trapdoor_sakura.png",
	wield_image = "upmod_trapdoor_sakura.png",
	tile_front = "upmod_trapdoor_sakura.png",
	tile_side = "upmod_trapdoor_sakura_side.png",
	gain_open = 0.06,
	gain_close = 0.13,
		groups = {snappy = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
		sound_open = "doors_glass_door_open",
		sound_close = "doors_glass_door_close",
		recipe = {
			{"group:stick", "default:paper"},
			{"default:paper", "group:stick"},
			{"ethereal:yellow_wood", "group:stick"}
		}
	})