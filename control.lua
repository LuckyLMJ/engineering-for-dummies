require("util")

remote.add_interface("speedup-burners",
   {addBurner = function(burner)
        table.insert(global["burners-to-check"], burner)
    end,
    addHeater = function(heater) 
        table.insert(global["heaters-to-check"], heater)
    end})

script.on_nth_tick(1, function(event) speedup_burners(event) end)

script.on_init(function()
    global["burners-to-check"] = {"burner-mining-drill", "burner-assembling-machine", "burner-lab", "stone-furnace", "steel-furnace"}
    global["heaters-to-check"] = {} --we don't have any heat based machines. but we could, later. 

    --check for janky quality mod
    if (game.active_mods["janky-quality"]) then
        local btc = table.deepcopy(global["burners-to-check"])
        --add qualities for each burner machine.
        for _, burner in pairs(btc) do
            for i=2, 5 do
                remote.call("speedup-burners", "addBurner", burner .. "-quality-" .. i);
            end
        end
    end

    global["burner-speedups"] = {}

    for _, burner in pairs(global["burners-to-check"]) do
        global["burner-speedups"][burner] = {}
    end

    for _, burner in pairs(global["heaters-to-check"]) do
        global["burner-speedups"][burner] = {}
    end

    global["burners"] = {}
    for _, burner in pairs(global["burners-to-check"]) do
        global["burners"][burner] = {}
    end
    for _, burner in pairs(global["heaters-to-check"]) do
        global["burners"][burner] = {}
    end
    global["burners"]["burner-beacon"] = {}
end)

function addBeaconToBurners(event)
    local entity = event.entity or event.created_entity or event.destination
    local checked = util.list_to_map(global["burners-to-check"])
    if (checked[entity.name]) then
        table.insert(global["burners"][entity.name], entity);
    end

    local checked = util.list_to_map(global["heaters-to-check"])
    if (checked[entity.name]) then
        table.insert(global["burners"][entity.name], entity);
    end
end

script.on_configuration_changed(function()
    global["burners-to-check"] = {"burner-mining-drill", "burner-assembling-machine", "burner-lab", "stone-furnace", "steel-furnace"}
    global["heaters-to-check"] = {} --we don't have any heat based machines. but we could, later. 

    --check for janky quality mod
    if (game.active_mods["janky-quality"]) then
        local btc = table.deepcopy(global["burners-to-check"])
        --add qualities for each burner machine.
        for _, burner in pairs(btc) do
            for i=2, 5 do
                remote.call("speedup-burners", "addBurner", burner .. "-quality-" .. i);
            end
        end
    end

    local surface = game.get_surface("nauvis")
    global["burner-speedups"] = {}
    for _, entity in pairs(global["burners-to-check"]) do
        global["burners"][entity] = surface.find_entities_filtered({name = entity})
        global["burner-speedups"][entity] = {}
    end
    for _, entity in pairs(global["heaters-to-check"]) do
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
    for _, entity in pairs(global["burners-to-check"]) do
        if (global["burners"][entity]) == nil then
            global["burners"][entity] = surface.find_entities_filtered({name = entity})
        end
        if (global["burner-speedups"][entity]) == nil then
            global["burner-speedups"][entity] = {}
        end
    end

    for _, entity in pairs(global["heaters-to-check"]) do
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
        for _, entity in pairs(global["burners-to-check"]) do
            if (surface.find_entity(entity, beacon.position)) then
                burner = true
                goto continue
            end
        end
        for _, entity in pairs(global["heaters-to-check"]) do
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

    for _, entity in pairs(global["burners-to-check"]) do
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

    for _, entity in pairs(global["heaters-to-check"]) do
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

            local isCrafting = burner.active and burner.status == defines.entity_status.working and burner.temperature

            if (not global["burner-speedups"][entity][unitNumber]) then
                global["burner-speedups"][entity][unitNumber] = 0
                goto continue
            end

            if (not isCrafting) then
                global["burner-speedups"][entity][unitNumber] = global["burner-speedups"][entity][unitNumber] - 0.25    
                if (global["burner-speedups"][entity][unitNumber] < 0) then
                    global["burner-speedups"][entity][unitNumber] = 0
                end
                goto continue
            end

            local fuelAccel = (burner.temperature or 0) / 500

            local speedupValue = global["burner-speedups"][entity][unitNumber]
            if (speedupValue == fuelAccel) then
                goto continue
            end

            if (isCrafting) then
                speedupValue = speedupValue + 0.02*fuelAccel --0.02 means it'll take 50 seconds to get to full speed
            end

            if (speedupValue > fuelAccel) then
                speedupValue = fuelAccel
            end

            global["burner-speedups"][entity][unitNumber] = speedupValue

            local numModules = speedupValue * 10;
            numModules = math.ceil(numModules);
            numModules = numModules - 5;

            
            local beacon = surface.find_entity('burner-beacon', burner.position)
            if (beacon == nil) then
                beacon = surface.create_entity({name = "burner-beacon", position = burner.position})
                table.insert(global["burners"]["burner-beacon"], beacon);
            end

            beacon.get_module_inventory().clear()

            if (numModules < 0) then
                local i = numModules;
                repeat
                    beacon.get_module_inventory().insert({name = "burner-slowdown-module"})
                    i = i + 1
                until i >= 0
            else
                local i = 0;
                repeat
                    beacon.get_module_inventory().insert({name = "burner-speed-module"})
                    beacon.get_module_inventory().insert({name = "burner-productivity-module"})
                    i = i + 1
                until i >= numModules
            end
            
            ::continue::
        end
    end
end