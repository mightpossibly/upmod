---- Concrete

--[[local dyes = dye.dyes

for i = 1, #dyes do
	local name, desc = unpack(dyes[i])--]]
	
local colors = {
	{"white",		"White", 		"FFFFFF",},
	{"grey",		"Grey", 		"5A5A5A",},
	{"dark_grey",	"Dark Grey", 	"2A2A2A",},
	{"black",		"Black", 		"000000",},
	{"violet",		"Violet", 		"4A078B",}, 
	{"blue",		"Blue", 		"01297C",},
	{"cyan",		"Cyan",			"015970",},
	{"dark_green",	"Dark Green", 	"233A07",}, 
	{"green",		"Green", 		"3E8C02",},
	{"yellow",		"Yellow", 		"BA9101",},
	{"brown",		"Brown", 		"401905",}, 
	{"orange",		"Orange",		"BC5700",},
	{"red",			"Red",			"730506",},
	{"magenta",		"Magenta",		"951090",},
	{"pink",		"Pink", 		"AE477A",},
	{"light_blue",	"Light Blue",	"066EAC",}
}

for i in ipairs(colors) do
	local name = colors[i][1]
	local desc = colors[i][2]
	local color = colors[i][3]
	
		-- Register Concrete Powder
	minetest.register_node("upmod:"..name.."_concrete_powder", {
		description = (desc .. " Concrete Powder"),
		tiles = {"upmod_concrete_powder.png^[colorize:#"..color..":135"},
		is_ground_content = false,
		groups = {crumbly = 3, falling_node = 1, sand = 1},
        sounds = default.node_sound_sand_defaults(),
	})
	
	minetest.register_alias("upmod:concrete_powder_"..name, "upmod:"..name.."_concrete_powder")

	
	-- Register Concrete Blocks
	minetest.register_node("upmod:"..name.."_concrete", {
		description = (desc .. " Concrete"),
		tiles = {"upmod_concrete_"..name..".png"},
		is_ground_content = false,
		groups = {cracky = 3},
		sounds = default.node_sound_stone_defaults(),
	})

	-- Add stair- and slab variations; Register moreblocks variations of the concrete blocks (if moreblocks is present)
	stairsplus:register_all("moreblocks", "upmod_"..name.."_concrete", "upmod:"..name.."_concrete",{
			description = (desc .. " Concrete"),
			tiles = {"upmod_concrete_" .. name .. ".png"},
			groups = {cracky = 3},
			sounds = default.node_sound_stone_defaults(),
	})

	minetest.register_alias("stairs:stair_outer_concrete_"..name, "moreblocks:stair_upmod_"..name.."_concrete_outer")
	minetest.register_alias("stairs:stair_inner_concrete_"..name, "moreblocks:stair_upmod_"..name.."_concrete_inner")
	minetest.register_alias("stairs:stair_concrete_"..name, "moreblocks:stair_upmod_"..name.."_concrete")
	minetest.register_alias("stairs:slab_concrete_"..name, "moreblocks:slab_upmod_"..name.."_concrete")

--[[

stairs:stair_outer_concrete_blue > moreblocks:stair_upmod_blue_concrete_outer
stairs:stair_inner_concrete_blue > moreblocks:stair_upmod_blue_concrete_inner
stairs:stair_concrete_blue > moreblocks:stair_upmod_blue_concrete
stairs:slab_concrete_blue > moreblocks:slab_upmod_blue_concrete


stairsplus:register_all("bakedclay", "baked_clay_" .. clay[1],
				"bakedclay:" .. clay[1], {
			description = clay[2] .. " Baked Clay",
			tiles = {"baked_clay_" .. clay[1] .. ".png"},
			groups = {cracky = 3},
			sounds = default.node_sound_stone_defaults()
		})
		
		--]]

	--minetest.register_alias("upmod:"..name.."_concrete", "upmod:concrete_"..name)
	minetest.register_alias("upmod:concrete_"..name, "upmod:"..name.."_concrete")
	
	-- Register crafting recipes for concrete powder
	minetest.register_craft{
		type = "shapeless",
		output = "upmod:"..name.."_concrete_powder 8",
		recipe = {"group:dye,color_" .. name, "group:sand", "group:sand",
					"group:sand", "group:sand", "default:gravel",
					"default:gravel", "default:gravel", "default:gravel",
		},	
	}
		


	--[[	
	
	stairs.register_stair_and_slab("concrete_"..name, "upmod:concrete_"..name,
		{cracky=2},
		{"upmod_concrete_"..name..".png" },
		(desc.." Concrete Stair"),
		(desc.." Concrete Slab"),
		default.node_sound_stone_defaults())
	
	-- Remove/comment out this line later, after node names have been switched
	minetest.register_alias("upmod:"..name.."_concrete", "upmod:concrete_"..name)
	minetest.register_alias("upmod:"..name.."_concrete", "upmod:concrete_"..name)
	--]]
end


		-- Add water mixing
	-- Make Concrete Powder react with Water to make Concrete
default.mix_concrete = function(pos, node)
		if node.name == "upmod:white_concrete_powder" then
			minetest.set_node(pos, {name = "upmod:white_concrete"})
		end
		if node.name == "upmod:grey_concrete_powder" then
			minetest.set_node(pos, {name = "upmod:grey_concrete"})
		end
		if node.name == "upmod:dark_grey_concrete_powder" then
			minetest.set_node(pos, {name = "upmod:dark_grey_concrete"})
		end
		if node.name == "upmod:black_concrete_powder" then
			minetest.set_node(pos, {name = "upmod:black_concrete"})
		end
		if node.name == "upmod:red_concrete_powder" then
			minetest.set_node(pos, {name = "upmod:red_concrete"})
		end
		if node.name == "upmod:pink_concrete_powder" then
			minetest.set_node(pos, {name = "upmod:pink_concrete"})
		end
		if node.name == "upmod:violet_concrete_powder" then
			minetest.set_node(pos, {name = "upmod:violet_concrete"})
		end
		if node.name == "upmod:blue_concrete_powder" then
			minetest.set_node(pos, {name = "upmod:blue_concrete"})
		end
		if node.name == "upmod:cyan_concrete_powder" then
			minetest.set_node(pos, {name = "upmod:cyan_concrete"})
		end
		if node.name == "upmod:dark_green_concrete_powder" then
			minetest.set_node(pos, {name = "upmod:dark_green_concrete"})
		end
		if node.name == "upmod:brown_concrete_powder" then
			minetest.set_node(pos, {name = "upmod:brown_concrete"})
		end
		if node.name == "upmod:orange_concrete_powder" then
			minetest.set_node(pos, {name = "upmod:orange_concrete"})
		end
		if node.name == "upmod:magenta_concrete_powder" then
			minetest.set_node(pos, {name = "upmod:magenta_concrete"})
		end
		if node.name == "upmod:light_blue_concrete_powder" then
			minetest.set_node(pos, {name = "upmod:light_blue_concrete"})
		end
		if node.name == "upmod:yellow_concrete_powder" then
			minetest.set_node(pos, {name = "upmod:yellow_concrete"})
		end
		if node.name == "upmod:green_concrete_powder" then
			minetest.set_node(pos, {name = "upmod:green_concrete"})
		end
end

for i in ipairs(colors) do
	local name = colors[i][1]

	minetest.register_abm({
		label = "Concrete Mixing",
		nodenames = {"upmod:concrete_powder_"..name},
		neighbors = {"group:water"},
		interval = 1,
		chance = 1,
		action = function(...)
			default.mix_concrete(...)
		end
	})
	
end

-- Backwards compatibility: Replace colored_concrete with the new ones in upmod
minetest.register_alias("colored_concrete:white", "upmod:white_concrete")
minetest.register_alias("colored_concrete:gray", "upmod:grey_concrete")
minetest.register_alias("colored_concrete:darkgray", "upmod:dark_grey_concrete")
minetest.register_alias("colored_concrete:black", "upmod:black_concrete")
minetest.register_alias("colored_concrete:red", "upmod:red_concrete")
minetest.register_alias("colored_concrete:pink", "upmod:pink_concrete")
minetest.register_alias("colored_concrete:yellow", "upmod:yellow_concrete")
minetest.register_alias("colored_concrete:orange", "upmod:orange_concrete")
minetest.register_alias("colored_concrete:brown", "upmod:brown_concrete")
minetest.register_alias("colored_concrete:green", "upmod:dark_green_concrete")
minetest.register_alias("colored_concrete:lightgreen", "upmod:green_concrete")
minetest.register_alias("colored_concrete:turquoise", "upmod:cyan_concrete")
minetest.register_alias("colored_concrete:lightblue", "upmod:light_blue_concrete")
minetest.register_alias("colored_concrete:blue", "upmod:blue_concrete")
minetest.register_alias("colored_concrete:violet", "upmod:violet_concrete")
minetest.register_alias("colored_concrete:magenta", "upmod:magenta_concrete")