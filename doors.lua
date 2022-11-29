-- Wood types that already have doors; default:wood and ethereal:sakura_wood

local wood_types = {
	{"Jungle Tree",	"default:junglewood", 			"jungle",},
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
	{"Redwood",		"ethereal:red_wood", 			"red",},
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

end