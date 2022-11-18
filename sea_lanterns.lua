

local dyes = dye.dyes

for i = 1, #dyes do
	local name, desc = unpack(dyes[i])
	
	-- Register the sea lanterns: 1 color for each dye present
	minetest.register_node("upmod:"..name.."_sea_lantern", {
		description = (desc .. " Sea Lantern"),
		tiles = {"sea_lantern_" .. name .. ".png"},
		is_ground_content = false,
		groups = {cracky = 3},
		sunlight_propagates = true,
		is_ground_content = false,
		groups = {cracky = 3, oddly_breakable_by_hand = 3, },
		sounds = default.node_sound_glass_defaults(),
		light_source = default.LIGHT_MAX,
	})
	
	-- Remove/comment out this line later, after node names have been switched
	--minetest.register_alias("upmod:"..name.."_sea_lantern", "upmod:sea_lantern_"..name)
	minetest.register_alias("upmod:sea_lantern_"..name, "upmod:"..name.."_sea_lantern")
	
	-- Register crafting recipes
	minetest.register_craft{
		type = "shapeless",
		output = "upmod:"..name.."_sea_lantern",
		recipe = {"dye:" .. name, "xocean:sea_lantern",},	
	}
end