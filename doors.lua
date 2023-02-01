-- Wood types that already have doors; default:wood and ethereal:sakura_wood

local function meseconify_door(name)
	if minetest.registered_items[name .. "_b_1"] then
		-- old style double-node doors
		local function toggle_state1 (pos)
			on_rightclick(pos, 1, name.."_t_1", name.."_b_2", name.."_t_2", {1,2,3,0})
		end

		local function toggle_state2 (pos)
			on_rightclick(pos, 1, name.."_t_2", name.."_b_1", name.."_t_1", {3,0,1,2})
		end

		minetest.override_item(name.."_b_1", {
			mesecons = {effector = {
				action_on = toggle_state1,
				action_off = toggle_state1,
				rules = mesecon.rules.pplate
			}}
		})

		minetest.override_item(name.."_b_2", {
			mesecons = {effector = {
				action_on = toggle_state2,
				action_off = toggle_state2,
				rules = mesecon.rules.pplate
			}}
		})
	elseif minetest.registered_items[name .. "_a"] then
		-- new style mesh node based doors
		local override = {
			mesecons = {effector = {
				action_on = function(pos)
					local door = doors.get(pos)
					if door then
						door:open()
					end
				end,
				action_off = function(pos)
					local door = doors.get(pos)
					if door then
						door:close()
					end
				end,
				rules = mesecon.rules.pplate
			}}
		}
		minetest.override_item(name .. "_a", override)
		minetest.override_item(name .. "_b", override)
		if minetest.registered_items[name .. "_c"] then
			minetest.override_item(name .. "_c", override)
			minetest.override_item(name .. "_d", override)
		end
	end
end



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
	{"Redwood",		"ethereal:redwood_wood", 		"redwood",},
	{"Frost Tree",	"ethereal:frost_wood", 			"frost",},
	{"Healing Tree","ethereal:yellow_wood", 		"yellow",}
}


-- Register Doors in 'wood_types' table
for i in ipairs(wood_types) do
	local desc = wood_types[i][1]
	local craft = wood_types[i][2]
	local name = wood_types[i][3]

	doors.register("upmod:door_"..name, {
		tiles = {
			{name = "upmod_door_"..name..".png", backface_culling = true}
		},
		description = (desc.." Door"),
		inventory_image = "upmod_door_item_"..name..".png",
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
	
	-- Make doors compatible with mesecon signals
	meseconify_door("upmod:door_"..name)
	
	-- Register Trapdoors in 'wood_types' table
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
		recipe = {
			{craft, craft, craft},
			{craft, craft, craft}
			}
	})
	
	-- 
	meseconify_door("upmod:trapdoor_"..name)
	
	minetest.register_craft({
		type = "shaped",
		output = "upmod:trapdoor_"..name,
		recipe = {
			{craft,craft,craft},
			{craft,craft,craft},
			{"","",""}
		}
	})
end



-- Register Bamboo Door (paper door)
doors.register("upmod:door_bamboo", {
		tiles = {
			{name = "upmod_door_bamboo.png", backface_culling = true}
		},
		description = ("Bamboo Door"),
		inventory_image = "upmod_door_item_bamboo.png",
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
	})
	
meseconify_door("ethereal:door_sakura")
meseconify_door("upmod:door_bamboo")

-- Recipes (sakura, bamboo)
	minetest.register_craft({
		type = "shaped",
		output = "upmod:trapdoor_sakura",
		recipe = {
			{"ethereal:sakura_wood", "ethereal:sakura_wood", "ethereal:sakura_wood"},
			{"ethereal:sakura_wood", "ethereal:sakura_wood", "ethereal:sakura_wood"}
		}
	})

	minetest.register_craft({
		type = "shaped",
		output = "ethereal:door_sakura",
		recipe = {
			{"ethereal:sakura_wood", "ethereal:sakura_wood"},
			{"ethereal:sakura_wood", "ethereal:sakura_wood"},
			{"ethereal:sakura_wood", "ethereal:sakura_wood"}
		}
	})
	
	-- Bamboo Trapdoor
	minetest.register_craft({
		type = "shaped",
		output = "upmod:trapdoor_bamboo",
		recipe = {
			{"ethereal:bamboo_block", "default:paper", "ethereal:bamboo_block"},
			{"ethereal:bamboo_block", "group:stick", "ethereal:bamboo_block"}
		}
	})

--Mesecon compatibility for trapdoors
local override = {
		mesecons = {effector = {
			action_on = function(pos)
				local door = doors.get(pos)
				if door then
					door:open()
				end
			end,
			action_off = function(pos)
				local door = doors.get(pos)
				if door then
					door:close()
				end
			end,
		}},
	}


for i in ipairs(wood_types) do
	local name = wood_types[i][3]
	
	minetest.override_item(	"upmod:trapdoor_"..name, override)	
	minetest.override_item(	"upmod:trapdoor_"..name.."_open", override)	
end

minetest.override_item("upmod:trapdoor_sakura", override)	
minetest.override_item("upmod:trapdoor_sakura_open", override)
minetest.override_item("upmod:trapdoor_bamboo", override)	
minetest.override_item("upmod:trapdoor_bamboo_open", override)