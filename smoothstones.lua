
local smoothstones = {
	{"desert_sandstone",	"Desert Sandstone",		"default:desert_sandstone",},
	{"sandstone",			"Sandstone",			"default:sandstone",},
	{"quartz",				"Quartz",				"quartz:block",}
}

for i in ipairs(smoothstones) do
	local name = smoothstones[i][1]
	local description = smoothstones[i][2]
	local base = smoothstones[i][3]
	
	-- Register smoothstone blocks
	minetest.register_node("upmod:smooth_"..name, {
		description = "Smooth "..description,
		tiles = {"upmod_smooth_"..name..".png"},
		groups = {cracky = 2},
		sounds = default.node_sound_stone_defaults(),
	})
	
	-- Crafting recipes for smoothstones
	minetest.register_craft({
		type = "cooking",
		output = "upmod:smooth_"..name,
		recipe = base,
		cooktime = 10,
	})	
	
	-- Stairs & Slabs
	stairs.register_stair_and_slab("smooth_"..name, "upmod:smooth_"..name,
		{cracky=2},
		{"upmod_smooth_"..name..".png" },
		("Smooth "..description.." Stair"),
		("Smooth "..description.." Slab"),
		default.node_sound_stone_defaults())
end