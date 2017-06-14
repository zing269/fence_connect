-- adds a connect_to_fence group to various nodes and adds that group to the fence connect_to group list
fence_connect = {}

dofile(minetest.get_modpath("fence_connect") .. "/fence_connect.conf")

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
for _, name in pairs(fence_connect.connect_to_list) do
    add_connect_to_fence(name)
end
