-- Adds the add_group function, that allows for adding groups to nodes and items without overwriting existing properties
local function add_group(item_name, groups)
	local def_groups = minetest.registered_items[item_name].groups
	
	-- Add elements from groups to def_groups
	for group, value in pairs(groups) do
		def_groups[group] = value
	end

	minetest.override_item(item_name, {
		groups = def_groups
	})
end

-- Items to hide from inventory
local hide = {
	{"moretrees:date_palm_ffruit_trunk",},
	{"moretrees:date_palm_mfruit_trunk",},
	{"moretrees:date_palm_fruit_trunk",},
	{"moretrees:palm_fruit_trunk_gen",},
	{"moretrees:palm_fruit_trunk",},
	{"moretrees:palm_sapling",},
	{"moretrees:palm_trunk",},
	{"moretrees:palm_planks",}
}


for i in ipairs(hide) do
	local name = hide[i][1]
	
	add_group(name, {
				not_in_creative_inventory = 1,
				not_in_craft_guide = 1,
	})
	
end

