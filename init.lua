-- adds a connect_to_fence group to various nodes and adds that group to the fence connect_to group list

local def = {}
local connects_to = {}
local groups = {}

local function add_connect_to_fence(name)
    local def = minetest.registered_nodes[name]
    local groups = table.copy(def.groups)
    groups.connect_to_fence = 1
    minetest.override_item(name, { groups=groups })
end

-- get all "fence" group nodes
for name, _ in pairs(minetest.registered_nodes) do
    if minetest.get_item_group(name, "fence") ~= 0 then
        def = minetest.registered_nodes[name]
        connects_to = table.copy(def.connects_to)
        table.insert(connects_to,"group:connect_to_fence")
        minetest.override_item(name, { connects_to=connects_to })
    end
end

-- special fix for coloredwood 
if minetest.get_modpath("coloredwood") then
    def =  minetest.registered_nodes["default:fence_wood"]
    groups = table.copy(def.groups)
    groups.fence = 1
    connects_to = table.copy(def.connects_to)
    table.insert(connects_to,"group:connect_to_fence")
    minetest.override_item("default:fence_wood", { connects_to=connects_to })
end

-- let fences connect to these nodes:
add_connect_to_fence("default:stone")
add_connect_to_fence("default:cobble")
add_connect_to_fence("default:stonebrick")
add_connect_to_fence("default:stone_block")
add_connect_to_fence("default:mossycobble")
add_connect_to_fence("default:desert_stone")
add_connect_to_fence("default:desert_cobble")
add_connect_to_fence("default:desert_stonebrick")
add_connect_to_fence("default:desert_stone_block")
add_connect_to_fence("default:sandstone")
add_connect_to_fence("default:sandstonebrick")
add_connect_to_fence("default:sandstone_block")
add_connect_to_fence("default:desert_sandstone")
add_connect_to_fence("default:desert_sandstone_brick")
add_connect_to_fence("default:desert_sandstone_block")
add_connect_to_fence("default:silver_sandstone")
add_connect_to_fence("default:silver_sandstone_brick")
add_connect_to_fence("default:silver_sandstone_block")
add_connect_to_fence("default:obsidian")
add_connect_to_fence("default:obsidianbrick")
add_connect_to_fence("default:obsidian_block")
add_connect_to_fence("default:dirt")
add_connect_to_fence("default:dirt_with_grass")
add_connect_to_fence("default:dirt_with_grass_footsteps")
add_connect_to_fence("default:dirt_with_dry_grass")
add_connect_to_fence("default:dirt_with_snow")
add_connect_to_fence("default:dirt_with_rainforest_litter")


-- maybe
--add_connect_to_fence("default:sand")
--add_connect_to_fence("default:desert_sand")
--add_connect_to_fence("default:silver_sand")
--add_connect_to_fence("default:gravel")
--add_connect_to_fence("default:snow")

add_connect_to_fence("default:clay")
add_connect_to_fence("default:snowblock")
add_connect_to_fence("default:ice")

add_connect_to_fence("default:stone_with_coal")
add_connect_to_fence("default:coalblock")
add_connect_to_fence("default:stone_with_iron")
add_connect_to_fence("default:steelblock")
add_connect_to_fence("default:stone_with_copper")
add_connect_to_fence("default:copperblock")
add_connect_to_fence("default:stone_with_tin")
add_connect_to_fence("default:tinblock")
add_connect_to_fence("default:bronzeblock")
add_connect_to_fence("default:stone_with_gold")
add_connect_to_fence("default:goldblock")
add_connect_to_fence("default:stone_with_mese")
add_connect_to_fence("default:mese")
add_connect_to_fence("default:stone_with_diamond")
add_connect_to_fence("default:diamondblock")

add_connect_to_fence("default:cactus")
add_connect_to_fence("default:coral_brown")
add_connect_to_fence("default:coral_orange")
add_connect_to_fence("default:coral_skeleton")

add_connect_to_fence("default:glass")
add_connect_to_fence("default:obsidian_glass")
add_connect_to_fence("default:brick")
