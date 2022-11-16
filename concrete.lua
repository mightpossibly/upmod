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
	minetest.register_node("upmod:concrete_powder_"..name, {
		description = (desc .. " Concrete Powder"),
		tiles = {"concrete_powder.png^[colorize:#"..color..":135"},
		is_ground_content = false,
		groups = {crumbly = 3, falling_node = 1, sand = 1},
        sounds = default.node_sound_sand_defaults(),
	})
	
	-- Register Concrete Blocks
	minetest.register_node("upmod:concrete_"..name, {
		description = (desc .. " Concrete"),
		tiles = {"concrete_" .. name .. ".png"},
		is_ground_content = false,
		groups = {cracky = 3},
		sounds = default.node_sound_stone_defaults(),
	})
	
	-- Register crafting recipes for concrete powder
	minetest.register_craft{
		type = "shapeless",
		output = "upmod:concrete_powder_".. name .." 8",
		recipe = {"group:dye,color_" .. name, "group:sand", "group:sand",
					"group:sand", "group:sand", "default:gravel",
					"default:gravel", "default:gravel", "default:gravel",
		},	
	}
		
	-- Add stair- and slab variations
	stairs.register_stair_and_slab("concrete_"..name, "upmod:concrete_"..name,
		{cracky=2},
		{"concrete_"..name..".png" },
		(desc.." Concrete Stair"),
		(desc.." Concrete Slab"),
		default.node_sound_stone_defaults())
	
	--[[ Register moreblocks variations of the concrete blocks (if moreblocks is present)
	if minetest.get_modpath("moreblocks") then
		stairsplus:register_all("moreblocks", "upmod:concrete_" .. name, "upmod:concrete_" .. name,{
			description = S(desc .. " Concrete"),
			tiles = {"concrete_" .. name .. ".png"},
			groups = {cracky = 3},
			sounds = default.node_sound_stone_defaults(),
		})
	end 
	
	-- Remove/comment out this line later, after node names have been switched
	minetest.register_alias("upmod:"..name.."_concrete", "upmod:concrete_"..name)
	
	--]]
end


		-- Add water mixing
	-- Make Concrete Powder react with Water to make Concrete
default.mix_concrete = function(pos, node)
		if node.name == "upmod:concrete_powder_white" then
			minetest.set_node(pos, {name = "upmod:concrete_white"})
		end
		if node.name == "upmod:concrete_powder_grey" then
			minetest.set_node(pos, {name = "upmod:concrete_grey"})
		end
		if node.name == "upmod:concrete_powder_dark_grey" then
			minetest.set_node(pos, {name = "upmod:concrete_dark_grey"})
		end
		if node.name == "upmod:concrete_powder_black" then
			minetest.set_node(pos, {name = "upmod:concrete_black"})
		end
		if node.name == "upmod:concrete_powder_red" then
			minetest.set_node(pos, {name = "upmod:concrete_red"})
		end
		if node.name == "upmod:concrete_powder_pink" then
			minetest.set_node(pos, {name = "upmod:concrete_pink"})
		end
		if node.name == "upmod:concrete_powder_violet" then
			minetest.set_node(pos, {name = "upmod:concrete_violet"})
		end
		if node.name == "upmod:concrete_powder_blue" then
			minetest.set_node(pos, {name = "upmod:concrete_blue"})
		end
		if node.name == "upmod:concrete_powder_cyan" then
			minetest.set_node(pos, {name = "upmod:concrete_cyan"})
		end
		if node.name == "upmod:concrete_powder_dark_green" then
			minetest.set_node(pos, {name = "upmod:concrete_dark_green"})
		end
		if node.name == "upmod:concrete_powder_brown" then
			minetest.set_node(pos, {name = "upmod:concrete_brown"})
		end
		if node.name == "upmod:concrete_powder_orange" then
			minetest.set_node(pos, {name = "upmod:concrete_orange"})
		end
		if node.name == "upmod:concrete_powder_magenta" then
			minetest.set_node(pos, {name = "upmod:concrete_magenta"})
		end
	if node.name == "upmod:concrete_powder_light_blue" then
		minetest.set_node(pos, {name = "upmod:concrete_light_blue"})
	end
	if node.name == "upmod:concrete_powder_yellow" then
		minetest.set_node(pos, {name = "upmod:concrete_yellow"})
	end
	if node.name == "upmod:concrete_powder_green" then
		minetest.set_node(pos, {name = "upmod:concrete_green"})
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

--[[
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
minetest.register_alias("colored_concrete:magenta", "upmod:magenta_concrete")--]]