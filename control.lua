script.on_nth_tick(30, function(event) speedup_burners(event) end)

script.on_init(function()
    global["burner-speedups"] = {}
    global["burner-speedups"]["burner-mining-drill"] = {}
    global["burner-speedups"]["burner-assembling-machine"] = {}
end)

script.on_load(function()
    if (global["burner-speedups"] == nil) then
        global["burner-speedups"] = {}
    end
    if (global["burner-speedups"]["burner-mining-drill"] == nil) then
        global["burner-speedups"]["burner-mining-drill"] = {}
    end
    if (global["burner-speedups"]["burner-assembling-machine"] == nil) then
        global["burner-speedups"]["burner-assembling-machine"] = {}
    end
end)


function speedup_burners(_event)
    local surface = game.get_surface("nauvis")

    for _, beacon in ipairs(surface.find_entities_filtered({name = "burner-beacon"})) do
        beacon.get_module_inventory().clear()
        beacon.destroy()
    end

    local burnerDrills = surface.find_entities_filtered({name = "burner-mining-drill"})
    for _, drill in ipairs(burnerDrills) do
        local isCrafting = drill.is_crafting and drill.active and drill.mining_target ~= nil and drill.burner.currently_burning and drill.mining_progress > 0
        local unitNumber = drill.unit_number

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

        local fuelAccel = 1
        if (drill.get_fuel_inventory()[1] ~= nil) then
            if (drill.get_fuel_inventory()[1].valid_for_read) then
                fuelAccel = drill.get_fuel_inventory()[1].prototype.fuel_acceleration_multiplier
            end
        end

        local speedupValue = global["burner-speedups"]["burner-mining-drill"][unitNumber]
        
        speedupValue = speedupValue + 0.01*fuelAccel*0.5 --0.01 means it'll take 100 seconds to get to full speed

        if (speedupValue > fuelAccel) then
            speedupValue = fuelAccel
        end

        global["burner-speedups"]["burner-mining-drill"][unitNumber] = speedupValue

        local numModules = speedupValue * 10;
        numModules = math.floor(numModules);

        local beacon = surface.create_entity({name = "burner-beacon", position = drill.position})
        local i = 0;
        repeat
            beacon.get_module_inventory().insert({name = "burner-speed-module"})
            i = i + 1
        until i >= numModules
        ::continue::
    end

    local burnerAssemblers = surface.find_entities_filtered({name = "burner-assembling-machine"});
    for _, assembler in ipairs(burnerAssemblers) do
        local isCrafting = assembler.is_crafting and assembler.active and assembler.burner.currently_burning and assembler.crafting_progress > 0
        local unitNumber = assembler.unit_number

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

        local fuelAccel = 1
        if (assembler.get_fuel_inventory()[1] ~= nil) then
            if (assembler.get_fuel_inventory()[1].valid_for_read) then
                fuelAccel = assembler.get_fuel_inventory()[1].prototype.fuel_acceleration_multiplier
            end
        end

        local speedupValue = global["burner-speedups"]["burner-assembling-machine"][unitNumber]
        
        speedupValue = speedupValue + 0.01*fuelAccel*0.5 --0.01 means it'll take 100 seconds to get to full speed

        if (speedupValue > fuelAccel) then
            speedupValue = fuelAccel
        end

        global["burner-speedups"]["burner-assembling-machine"][unitNumber] = speedupValue

        local numModules = speedupValue * 10;
        numModules = math.floor(numModules);

        local beacon = surface.create_entity({name = "burner-beacon", position = assembler.position})
        local i = 0;
        repeat
            beacon.get_module_inventory().insert({name = "burner-speed-module"})
            i = i + 1
        until i >= numModules
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