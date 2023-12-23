local MN = minetest.get_current_modname()
local S  = minetest.get_translator(MN)
local MP = minetest.get_modpath(MN)

--dofile(MP.."/nodes.lua")

-- TODO modes
-- - kill half the players
-- - reset "dead" for all players
-- - teleportation
-- - remove blocks and/or allow placing on air/water
-- - grab nearby objects
-- - get player positions / views
-- - time fast / slow / stop

iagauntlet = {}

iagauntlet.register_stone = function(name, image, desc)
	-- TODO inactive version created by magick
	-- TODO   active version created by crafting ; checks for unique existence
	minetest.register_craftitem(name, {
		description = S(desc),
		image       = image,
		groups      = { infinity_stone = 1, not_in_creative_inventory = 1, },
	})
	-- TODO gauntlet crafted with stones
end

iagauntlet.register_stone(MN .. ":infinity_stone_power",   "infinity_stone_red.png",
	"Eliminates distance through teleportation and manipulation of space.")
iagauntlet.register_stone(MN .. ":infinity_stone_time",    "infinity_stone_orange.png",
	"Bestows limitless telepathic and telekinetic power.")
iagauntlet.register_stone(MN .. ":infinity_stone_reality", "infinity_stone_yellow.png",
	"Can alter a being's core personality, access the collective unconscious and confer souls to a peaceful Soulworld dimension.")
iagauntlet.register_stone(MN .. ":infinity_stone_soul",    "infinity_stone_green.png",
	"Can rewrite existence and alter reality; doing so without the other Infinity Stones poses immense risk.")
iagauntlet.register_stone(MN .. ":infinity_stone_mind",    "infinity_stone_blue.png",
	"Enables time travel, freezing of time and manipulation of age; in conjuction with other stones, can alter the past.")
iagauntlet.register_stone(MN .. ":infinity_stone_space",   "infinity_stone_purple.png",
	"Grants unlimited strength and energy manipulation; fuels the other Infinity Stones.")

print("[OK] IA Gauntlet")

