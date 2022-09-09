-- Load support for MT game translation.
local S = minetest.get_translator("wool")

local dyes = dye.dyes

for i = 1, #dyes do
	local name, desc = unpack(dyes[i])

	minetest.register_node("upmod:concrete" .. name, {
		description = S(desc .. " Concrete"),
		tiles = {"upmod_concrete_" .. name .. ".png"},
		is_ground_content = false,
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3,
				flammable = 3, wool = 1},
		sounds = default.node_sound_defaults(),
	})

	minetest.register_craft{
		type = "shapeless",
		output = "concrete:" .. name,
		recipe = {"group:dye,color_" .. name, "group:concrete"},
	}
end