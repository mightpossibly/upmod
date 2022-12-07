
local lightstone_rules = {
	{x=0,  y=0,  z=-1},
	{x=1,  y=0,  z=0},
	{x=-1, y=0,  z=0},
	{x=0,  y=0,  z=1},
	{x=1,  y=1,  z=0},
	{x=1,  y=-1, z=0},
	{x=-1, y=1,  z=0},
	{x=-1, y=-1, z=0},
	{x=0,  y=1,  z=1},
	{x=0,  y=-1, z=1},
	{x=0,  y=1,  z=-1},
	{x=0,  y=-1, z=-1},
	{x=0,  y=-1, z=0},
}

local dyes = dye.dyes

for i = 1, #dyes do
	local name, desc = unpack(dyes[i])
	
	-- Register the sea lanterns: 1 color for each dye present
	minetest.register_node("upmod:"..name.."_sea_lantern", {
		description = (desc .. " Sea Lantern"),
		tiles = {"upmod_sea_lantern_" .. name .. ".png"},
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
	
	-- Register crafting recipes for regular sea lanterns
	minetest.register_craft{
		type = "shapeless",
		output = "upmod:"..name.."_sea_lantern",
		recipe = {"dye:" .. name, "xocean:sea_lantern",},	
	}
	
	-- Register mese powered sea lanterns
		minetest.register_node("upmod:"..name.."_sea_lantern_powered_off", {
		description = (desc.." Sea Lantern (Powered)"),
		tiles = {"upmod_sea_lantern_"..name.."_off.png"},
		is_ground_content = false,
		groups = {cracky = 3, mesecon = 2, oddly_breakable_by_hand = 3},
		sunlight_propagates = true,
		sounds = default.node_sound_glass_defaults(),
		mesecons = {effector = {
			rules = lightstone_rules,
			action_on = function (pos, node)
				minetest.swap_node(pos, {name = "upmod:"..name.."_sea_lantern_powered_on", param2 = node.param2})
			end,
		}},
	})

	minetest.register_node("upmod:"..name.."_sea_lantern_powered_on", {
		description = (desc.." Sea Lantern (Powered)"),
		tiles = {"upmod_sea_lantern_"..name..".png"},
		is_ground_content = false,
		groups = {not_in_creative_inventory = 1, cracky = 3, not_in_craft_guide = 1, mesecon = 2, oddly_breakable_by_hand = 3},
		sunlight_propagates = true,
		drop = "upmod:"..name.."_sea_lantern_powered_off",
		sounds = default.node_sound_glass_defaults(),
		light_source = default.LIGHT_MAX,
		mesecons = {effector = {
			rules = lightstone_rules,
			action_off = function (pos, node)
				minetest.swap_node(pos, {name = "upmod:"..name.."_sea_lantern_powered_off", param2 = node.param2})
			end,
		}},
	})
	
	minetest.register_craft({
    type = "shaped",
    output = "upmod:"..name.."_sea_lantern_powered_off",
    recipe = {
        {"",				"group:mesecon_conductor_craftable",				""},
        {"group:mesecon_conductor_craftable",	"upmod:"..name.."_sea_lantern",	"group:mesecon_conductor_craftable"},
		{"",				"group:mesecon_conductor_craftable",				""}
    }
})

	
end