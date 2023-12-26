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

--function iadiscordia.register_replacement(name, repl, password)
--	iadiscordia.register_spell(name, {
--		password=password,
--		callback=function(user)
--			return repl
--		end,
--	})
--end

iagauntlet.register_stone = function(name, image, desc, pw)
	-- TODO inactive version created by magick
	-- TODO   active version created by crafting ; checks for unique existence
	-- on use:
	-- - if any infinity stone has been used recently
	--   - if this infinity stone is registered
	--     - if this instance matches the registered instance
	--       - use it
	--     - else destroy this infinity stone instance
	--   - else register this infinity stone instance
	-- - else
	--   - register this infinity stone instance

	local diamond                    = "default:diamond"
	local def                        = table.copy(minetest.registered_items[diamond])
	def.description                  = S(desc)
	def.image                        = image
	def.wield_image                  = image
	def.inventory_image              = image
	def.light_source                 = minetest.LIGHT_MAX
	local groups                     = def.groups
	--assert(groups ~= nil)
	if groups == nil then
		groups = {}
	else groups = table.copy(groups)
	end
	groups.infinity_stone            = 1
	groups.not_in_creative_inventory = 1 -- TODO
	def.groups = groups
	--def.on_use          = on_use
	minetest.register_craftitem(name, def)

	assert(iadiscordia.register_replacement ~= nil)
	iadiscordia.register_replacement(diamond, name, pw)
end

iagauntlet.register_stone(MN .. ":infinity_stone_power",   "infinity_stone_red.png",
	"Eliminates distance through teleportation and manipulation of space.",
	"Power")
iagauntlet.register_stone(MN .. ":infinity_stone_time",    "infinity_stone_orange.png",
	"Bestows limitless telepathic and telekinetic power.",
	"Time")
iagauntlet.register_stone(MN .. ":infinity_stone_reality", "infinity_stone_yellow.png",
	"Can alter a being's core personality, access the collective unconscious and confer souls to a peaceful Soulworld dimension.",
	"Reality")
iagauntlet.register_stone(MN .. ":infinity_stone_soul",    "infinity_stone_green.png",
	"Can rewrite existence and alter reality; doing so without the other Infinity Stones poses immense risk.",
	"Soul")
iagauntlet.register_stone(MN .. ":infinity_stone_mind",    "infinity_stone_blue.png",
	"Enables time travel, freezing of time and manipulation of age; in conjuction with other stones, can alter the past.",
	"Mind")
iagauntlet.register_stone(MN .. ":infinity_stone_space",   "infinity_stone_purple.png",
	"Grants unlimited strength and energy manipulation; fuels the other Infinity Stones.",
	"Space")


--  TODO custom image
assert(armor.materials.gold)
local gloves_gold                = "3d_armor_gloves:gloves_gold"
local def                        = table.copy(minetest.registered_tools[gloves_gold])
assert(def ~= nil)
def.description                  = S("Infinity Gauntlet")
local groups                     = def.groups
assert(groups ~= nil)
if groups == nil then
	groups                     = {
		armor_hands=1, armor_heal=6, armor_use=300,
		physics_speed=-0.02, physics_gravity=0.02
	}
else groups = table.copy(groups)
end
groups.light_source              = minetest.LIGHT_MAX
groups.infinity_stone            = 1
groups.not_in_creative_inventory = 1
-- TODO on_use, on_rightclick

armor:register_armor("iagauntlet:gauntlets", def)

minetest.register_craft({
   type         = "shapeless",
   output       = 'iagauntlet:gauntlets',
   recipe       = {
	   gloves_gold,
	   'iagauntlet:infinity_stone_power',
	   'iagauntlet:infinity_stone_time',
	   'iagauntlet:infinity_stone_reality',
	   'iagauntlet:infinity_stone_soul',
	   'iagauntlet:infinity_stone_mind',
	   'iagauntlet:infinity_stone_space',
   },
})

print("[OK] IA Gauntlet")

