script.on_nth_tick(1, function(event) speedup_burners(event) end)

script.on_init(function()
    global["burner-speedups"] = {}
    global["burner-speedups"]["burner-mining-drill"] = {}
    global["burner-speedups"]["burner-assembling-machine"] = {}

    global["burners"] = {}
    global["burners"]["burner-mining-drill"] = {}
    global["burners"]["burner-assembling-machine"] = {}
    global["burners"]["burner-beacon"] = {}
end)

script.on_event(defines.events.on_built_entity, function(event)
    local entity = event.entity or event.created_entity or event.destination
    if (entity) then
        if (entity.name == "burner-mining-drill") then
            table.insert(global["burners"]["burner-mining-drill"], entity);
        end

        if (entity.name == "burner-assembling-machine") then
            table.insert(global["burners"]["burner-assembling-machine"], entity);
        end
    end
end)

script.on_event(defines.events.on_entity_cloned, function(event)
    local entity = event.entity or event.created_entity or event.destination
    if (entity) then
        if (entity.name == "burner-mining-drill") then
            table.insert(global["burners"]["burner-mining-drill"], entity);
        end

        if (entity.name == "burner-assembling-machine") then
            table.insert(global["burners"]["burner-assembling-machine"], entity);
        end
    end
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
    local entity = event.entity or event.created_entity or event.destination
    if (entity) then
        if (entity.name == "burner-mining-drill") then
            table.insert(global["burners"]["burner-mining-drill"], entity);
        end

        if (entity.name == "burner-assembling-machine") then
            table.insert(global["burners"]["burner-assembling-machine"], entity);
        end
    end
end)

script.on_event(defines.events.script_raised_built, function(event)
    local entity = event.entity or event.created_entity or event.destination
    if (entity) then
        if (entity.name == "burner-mining-drill") then
            table.insert(global["burners"]["burner-mining-drill"], entity);
        end

        if (entity.name == "burner-assembling-machine") then
            table.insert(global["burners"]["burner-assembling-machine"], entity);
        end
    end
end)

script.on_event(defines.events.script_raised_revive, function(event)
    local entity = event.entity or event.created_entity or event.destination
    if (entity) then
        if (entity.name == "burner-mining-drill") then
            table.insert(global["burners"]["burner-mining-drill"], entity);
        end

        if (entity.name == "burner-assembling-machine") then
            table.insert(global["burners"]["burner-assembling-machine"], entity);
        end
    end
end)

script.on_event(defines.events.on_trigger_created_entity, function(event)
    local entity = event.entity or event.created_entity or event.destination
    if (entity) then
        if (entity.name == "burner-mining-drill") then
            table.insert(global["burners"]["burner-mining-drill"], entity);
        end

        if (entity.name == "burner-assembling-machine") then
            table.insert(global["burners"]["burner-assembling-machine"], entity);
        end
    end
end)


function speedup_burners(_event)
    local surface = game.get_surface("nauvis")

    if (global["burners"] == nil) then
        global["burners"] = {}
    end

    if (global["burners"]["burner-mining-drill"] == nil) then
        global["burners"]["burner-mining-drill"] = surface.find_entities_filtered({name = "burner-mining-drill"})
    end
    if (global["burners"]["burner-assembling-machine"] == nil) then
        global["burners"]["burner-assembling-machine"] = surface.find_entities_filtered({name = "burner-assembling-machine"})
    end
    if (global["burners"]["burner-beacon"] == nil) then
        global["burners"]["burner-beacon"] = surface.find_entities_filtered({name = "burner-beacon"})
    end

    local burnerBeacons = global["burners"]["burner-beacon"]
    for index, beacon in ipairs(burnerBeacons) do
        if (beacon == nil) then
            table.remove(global["burners"]["burner-beacon"], index)
            goto continue
        end

        if (not beacon.valid) then
            table.remove(global["burners"]["burner-beacon"], index)
            goto continue
        end

        local unitNumber = beacon.unit_number
        if (unitNumber % 60 ~= game.tick % 60) then
            goto continue
        end

        local assemblingMachine = surface.find_entities_filtered({name = 'burner-assembling-machine', area = beacon.bounding_box})[1]
        local drill = surface.find_entities_filtered({name = 'burner-mining-drill', area = beacon.bounding_box})[1]
        if (assemblingMachine == nil and drill == nil) then
            if (global["burners"]["burner-beacon"] ~= nil) then
                table.remove(global["burners"]["burner-beacon"], index)
            end
            beacon.get_module_inventory().clear()
            beacon.destroy()
        end

        ::continue::
    end

    local burnerDrills = global["burners"]["burner-mining-drill"]
    for index, drill in ipairs(burnerDrills) do
        if (drill == nil) then
            if (global["burners"]["burner-mining-drill"] ~= nil) then
                table.remove(global["burners"]["burner-mining-drill"], index)
            end
            goto continue
        end

        if (not drill.valid) then
            if (global["burners"]["burner-mining-drill"] ~= nil) then
                table.remove(global["burners"]["burner-mining-drill"], index)
            end
            goto continue
        end

        local unitNumber = drill.unit_number
        if (unitNumber % 60 ~= game.tick % 60) then
            goto continue
        end

        local isCrafting = drill.is_crafting and drill.active and drill.mining_target ~= nil and drill.burner.currently_burning and drill.mining_progress > 0

        if (global["burner-speedups"]["burner-mining-drill"][unitNumber] == nil) then
            global["burner-speedups"]["burner-mining-drill"][unitNumber] = 0
        end

        if (not isCrafting) then
            global["burner-speedups"]["burner-mining-drill"][unitNumber] = global["burner-speedups"]["burner-mining-drill"][unitNumber] - 0.10
            if (global["burner-speedups"]["burner-mining-drill"][unitNumber] < 0) then
                global["burner-speedups"]["burner-mining-drill"][unitNumber] = 0
            end
            goto continue
        end

        local fuelAccel = drill.burner.currently_burning.fuel_acceleration_multiplier or 1
        local fuelTopSpeed = drill.burner.currently_burning.fuel_top_speed_multiplier or 1
        fuelTopSpeed = fuelTopSpeed - 1

        local speedupValue = global["burner-speedups"]["burner-mining-drill"][unitNumber]
        
        speedupValue = speedupValue + 0.01*fuelAccel --0.01 means it'll take 100 seconds to get to full speed

        if (speedupValue > fuelAccel) then
            speedupValue = fuelAccel
        end

        global["burner-speedups"]["burner-mining-drill"][unitNumber] = speedupValue

        local numModules = speedupValue * 10;
        numModules = math.floor(numModules);

        local numProds = numModules * 10 * fuelTopSpeed
        numProds = math.floor(numProds);
        
        local beacon = surface.find_entities_filtered({name = 'burner-beacon', area = drill.bounding_box})[1]
        if (beacon == nil) then
            local centreX = (drill.bounding_box.left_top.x + drill.bounding_box.right_bottom.x) / 2
            local centreY = (drill.bounding_box.left_top.y + drill.bounding_box.right_bottom.y) / 2
            local centre = {centreX, centreY}
            beacon = surface.create_entity({name = "burner-beacon", position = centre})
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

    local burnerAssemblers = global["burners"]["burner-assembling-machine"]
    for index, assembler in ipairs(burnerAssemblers) do
        if (assembler == nil) then
            if (global["burners"]["burner-assembling-machine"] ~= nil) then
                table.remove(global["burners"]["burner-assembling-machine"], index)
            end
            goto continue
        end
        
        if (not assembler.valid) then
            if (global["burners"]["burner-assembling-machine"] ~= nil) then
                table.remove(global["burners"]["burner-assembling-machine"], index)
            end
            goto continue
        end

        local unitNumber = assembler.unit_number
        if (unitNumber % 60 ~= game.tick % 60) then
            goto continue
        end

        local isCrafting = assembler.is_crafting and assembler.active and assembler.burner.currently_burning and assembler.crafting_progress > 0

        if (global["burner-speedups"]["burner-assembling-machine"][unitNumber] == nil) then
            global["burner-speedups"]["burner-assembling-machine"][unitNumber] = 0
        end

        if (not isCrafting) then
            global["burner-speedups"]["burner-assembling-machine"][unitNumber] = global["burner-speedups"]["burner-assembling-machine"][unitNumber] - 0.10
            if (global["burner-speedups"]["burner-assembling-machine"][unitNumber] < 0) then
                global["burner-speedups"]["burner-assembling-machine"][unitNumber] = 0
            end
            goto continue
        end

        local fuelAccel = assembler.burner.currently_burning.fuel_acceleration_multiplier or 1
        local fuelTopSpeed = assembler.burner.currently_burning.fuel_top_speed_multiplier or 1
        fuelTopSpeed = fuelTopSpeed - 1

        local speedupValue = global["burner-speedups"]["burner-assembling-machine"][unitNumber]
        
        speedupValue = speedupValue + 0.01*fuelAccel --0.01 means it'll take 100 seconds to get to full speed

        if (speedupValue > fuelAccel) then
            speedupValue = fuelAccel
        end

        global["burner-speedups"]["burner-assembling-machine"][unitNumber] = speedupValue

        local numModules = speedupValue * 10;
        numModules = math.floor(numModules);

        local numProds = numModules * 10 * fuelTopSpeed
        numProds = math.floor(numProds);

        local beacon = surface.find_entities_filtered({name = 'burner-beacon', area = assembler.bounding_box})[1]
        if (beacon == nil) then
            beacon = surface.create_entity({name = "burner-beacon", position = assembler.position})
            table.insert(global["burners"]["burner-beacon"], beacon);
        end

        beacon.get_module_inventory().clear()

        local i = 0;
        repeat
            beacon.get_module_inventory().insert({name = "burner-speed-module"})
            i = i + 1
        until i >= numModules

        if (numProds > 0) then
            i = 0;
            repeat
                beacon.get_module_inventory().insert({name = "burner-productivity-module"})
                i = i + 1
            until i >= numProds
        end
        ::continue::
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