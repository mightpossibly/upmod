-- Replace Jungle Tree logs top and bottom texture with a better one
minetest.register_node(":default:jungletree", {
	description = ("Jungle Tree"),
	tiles = {"upmod_jungletree_top.png", "upmod_jungletree_top.png",
		"default_jungletree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})