do
    -- don't load if sim scenario has already loaded this (in another lua state)
    local modloader = remote.interfaces["modloader"]    
    if modloader and modloader[script.mod_name] then
      return
    end
end

require("util")

script.on_nth_tick(1, function(event) speedup_burners(event) end)

local burners_to_check = {"burner-mining-drill", "burner-assembling-machine", "burner-lab", "stone-furnace", "steel-furnace"}

script.on_init(function()
    global["burner-speedups"] = {}

    for _, burner in pairs(burners_to_check) do
        global["burner-speedups"][burner] = {}
    end

    global["burners"] = {}
    for _, burner in pairs(burners_to_check) do
        global["burners"][burner] = {}
    end
    global["burners"]["burner-beacon"] = {}
end)

function addBeaconToBurners(event)
    local entity = event.entity or event.created_entity or event.destination
    local checked = util.list_to_map(burners_to_check)
    if (checked[entity.name]) then
        table.insert(global["burners"][entity.name], entity);
    end
end

script.on_configuration_changed(function()
    local surface = game.get_surface("nauvis")
    global["burner-speedups"] = {}
    for _, entity in pairs(burners_to_check) do
        global["burners"][entity] = surface.find_entities_filtered({name = entity})
        global["burner-speedups"][entity] = {}
    end
end)

for _, event in pairs({
                    defines.events.on_built_entity,
                    defines.events.on_entity_cloned,
                    defines.events.on_entity_cloned, 
                    defines.events.script_raised_built, 
                    defines.events.script_raised_revive, 
                    defines.events.on_robot_built_entity,
                    defines.events.on_trigger_created_entity
                }) do
    script.on_event(event, addBeaconToBurners)
end

function speedup_burners(_event)
    local surface = game.get_surface("nauvis")


    if (global["burners"] == nil) then
        global["burners"] = {}
    end
    for _, entity in pairs(burners_to_check) do
        if (global["burners"][entity]) == nil then
            global["burners"][entity] = surface.find_entities_filtered({name = entity})
        end
        if (global["burner-speedups"][entity]) == nil then
            global["burner-speedups"][entity] = {}
        end
    end

    if (global["burners"]["burner-beacon"] == nil) then
        global["burners"]["burner-beacon"] = surface.find_entities_filtered({name = "burner-beacon"})
    end

    local burnerBeacons = global["burners"]["burner-beacon"]
    for index, beacon in pairs(burnerBeacons) do
        if (beacon == nil) then
            table.remove(global["burners"]["burner-beacon"], index)
            goto continue
        end

        if (not beacon.valid) then
            table.remove(global["burners"]["burner-beacon"], index)
            goto continue
        end

        local unitNumber = beacon.unit_number
        if (unitNumber % 240 ~= game.tick % 240) then
            goto continue
        end

        local burner = false;
        for _, entity in pairs(burners_to_check) do
            if (surface.find_entity(entity, beacon.position)) then
                burner = true
                goto continue
            end
        end
        
        if not burner then
            if (global["burners"]["burner-beacon"]) then
                table.remove(global["burners"]["burner-beacon"], index)
            end
            beacon.get_module_inventory().clear()
            beacon.destroy()
        end
        ::continue::
    end

    for _, entity in pairs(burners_to_check) do
        for index, burner in pairs(global["burners"][entity]) do
            if (not burner) then
                if (global["burners"][entity] ~= nil) then
                    table.remove(global["burners"][entity], index)
                end
                goto continue
            end 
            if (not burner.valid) then
                if (global["burners"][entity] ~= nil) then
                    table.remove(global["burners"][entity], index)
                end
                goto continue
            end

            local unitNumber = burner.unit_number

            if (unitNumber % 60 ~= game.tick % 60) then
                goto continue
            end

            local isCrafting = burner.active and burner.status == defines.entity_status.working and burner.burner.currently_burning

            if (not global["burner-speedups"][entity][unitNumber]) then
                global["burner-speedups"][entity][unitNumber] = 0
                goto continue
            end
            if (not isCrafting) then
                global["burner-speedups"][entity][unitNumber] = global["burner-speedups"][entity][unitNumber] - 0.10
                if (global["burner-speedups"][entity][unitNumber] < 0) then
                    global["burner-speedups"][entity][unitNumber] = 0
                end
                goto continue
            end

            local fuelAccel = burner.burner.currently_burning.fuel_acceleration_multiplier or 1
            local fuelTopSpeed = burner.burner.currently_burning.fuel_top_speed_multiplier or 1
            fuelTopSpeed = fuelTopSpeed - 1

            local speedupValue = global["burner-speedups"][entity][unitNumber]
            if (speedupValue == fuelAccel) then
                goto continue
            end

            if (isCrafting) then
                speedupValue = speedupValue + 0.01*fuelAccel --0.01 means it'll take 100 seconds to get to full speed
            end

            if (speedupValue > fuelAccel) then
                speedupValue = fuelAccel
            end

            global["burner-speedups"][entity][unitNumber] = speedupValue

            local numModules = speedupValue * 10;
            numModules = math.ceil(numModules);

            local numProds = numModules * 10 * fuelTopSpeed
            numProds = math.ceil(numProds);
            
            local beacon = surface.find_entity('burner-beacon', burner.position)
            if (beacon == nil) then
                beacon = surface.create_entity({name = "burner-beacon", position = burner.position})
                table.insert(global["burners"]["burner-beacon"], beacon);
            end

            beacon.get_module_inventory().clear()

            local i = 0;
            repeat
                beacon.get_module_inventory().insert({name = "burner-speed-module"})
                i = i + 1
            until i >= numModules

            if numProds > 0 then
                i = 0;
                repeat
                    beacon.get_module_inventory().insert({name = "burner-productivity-module"})
                    i = i + 1
                until i >= numProds
            end
            
            ::continue::
        end
    end
end

remote.add_interface("engineering-for-dummies", {
    milestones_presets = function()
        return {
            ["Engineering for Dummies"] = {
                required_mods = {"engineering-for-dummies"},
                milestones = {
                    {type="group",      name="Science"},
                    {type="item",       name="burner-science-pack",     quantity=1, next="x10"},
                    {type="item",       name="automation-science-pack", quantity=1, next="x10"},
                    {type="item",       name="logistic-science-pack",   quantity=1, next="x10"},
                    {type="item",       name="military-science-pack",   quantity=1, next="x10"},
                    {type="item",       name="chemical-science-pack",   quantity=1, next="x10"},
                    {type="item",       name="production-science-pack", quantity=1, next="x10"},
                    {type="item",       name="utility-science-pack",    quantity=1, next="x10"},
                    {type="item",       name="space-science-pack",      quantity=1, next="x10"},

                    {type="group",      name="Progress"},
                    {type="item",       name="burner-assembling-machine",quantity=1},
                    {type="item",       name="assembling-machine-1",    quantity=1},
                    {type="item",       name="locomotive",              quantity=1},
                    {type="fluid",      name="petroleum-gas",           quantity=1},
                    {type="fluid",      name="hydrochloric-acid",       quantity=1},
                    {type="fluid",      name="sulfuric-acid",           quantity=1},
                    {type="item",       name="construction-robot",      quantity=1},
                    {type="technology", name="rocket-silo",             quantity=1},
                    {type="item",       name="rocket-part",             quantity=100, next="x10"},
                    {type="item",       name="spidertron",              quantity=1},

                    {type="group",      name="Power"},
                    {type="item",       name="steam-engine",            quantity=1},
                    {type="item",       name="solar-panel",             quantity=1},
                    {type="item",       name="accumulator",             quantity=1},
                    {type="item",       name="nuclear-reactor",         quantity=1},

                    {type="group",      name="Scaling"},
                    {type="item",       name="iron-plate",              quantity=100, next="x10"},
                    {type="item",       name="copper-plate",            quantity=100, next="x10"},
                    {type="item",       name="glass-plate",             quantity=100, next="x10"},
                    {type="item",       name="steel-plate",             quantity=100, next="x10"},
                    {type="item",       name="advanced-circuit",        quantity=100, next="x10"},
                    {type="item",       name="processing-unit",         quantity=100, next="x10"},

                    {type="group",      name="Kills"},
                    {type="kill",       name="small-biter",             quantity=1},
                    {type="kill",       name="medium-biter",            quantity=1},
                    {type="kill",       name="big-biter",               quantity=1},
                    {type="kill",       name="behemoth-biter",          quantity=1, next="x10"},
                    {type="kill",       name="character",               quantity=1, next="x10"},
                }
            }
        }
    end
})