---- Concrete

local dyes = dye.dyes

for i = 1, #dyes do
	local name, desc = unpack(dyes[i])
	
	-- Register the concrete blocks: 1 color for each dye present
	minetest.register_node("upmod:concrete_"..name, {
		description = (desc .. " Concrete"),
		tiles = {"concrete_" .. name .. ".png"},
		is_ground_content = false,
		groups = {cracky = 3},
		sounds = default.node_sound_stone_defaults(),
	})
	
	-- Remove/comment out this line later, after node names have been switched
	minetest.register_alias("upmod:"..name.."_concrete", "upmod:concrete_"..name)
	
	-- Register the crafting recipes for the concrete blocks
	minetest.register_craft{
		type = "shapeless",
		output = "upmod:concrete_" .. name,
		recipe = {"group:dye,color_" .. name, "group:sand", "group:sand",
					"group:sand", "group:sand", "default:gravel",
					"default:gravel", "default:gravel", "default:gravel",
		},	
	}
	-- Stairs & Slabs
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
	end --]]
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