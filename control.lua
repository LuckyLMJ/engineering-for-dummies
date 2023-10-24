script.on_nth_tick(1, function(event) speedup_burners(event) end)

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
    local burnerDrills = surface.find_entities_filtered({name = "burner-mining-drill"});
    for _, drill in ipairs(burnerDrills) do
        local isCrafting = drill.is_crafting and drill.active and drill.mining_target ~= nil and drill.burner.currently_burning and drill.mining_progress > 0
        local unitNumber = drill.unit_number

        local fuelAccel = 1
        if (drill.get_fuel_inventory()[1] ~= nil) then
            if (drill.get_fuel_inventory()[1].valid_for_read) then
                fuelAccel = drill.get_fuel_inventory()[1].prototype.fuel_acceleration_multiplier
            end
        end
    
        if (global["burner-speedups"]["burner-mining-drill"][unitNumber] == nil) then
            global["burner-speedups"]["burner-mining-drill"][unitNumber] = 0
        end

        local speedupValue = global["burner-speedups"]["burner-mining-drill"][unitNumber]
        
        if (isCrafting) then
            speedupValue = speedupValue + 0.0001666*fuelAccel --0.0001666 means it will take approx. 6000 ticks (100 seconds) to build up to top speed
        else
            speedupValue = speedupValue - 0.02
        end

        if (speedupValue < 0) then
            speedupValue = 0
        end
        if (speedupValue > fuelAccel) then
            speedupValue = fuelAccel
        end

        global["burner-speedups"]["burner-mining-drill"][unitNumber] = speedupValue
        if (speedupValue > 0 and isCrafting) then
            local speed = drill.prototype.mining_speed

            drill.mining_progress = drill.mining_progress + (((speedupValue * speed)) / 60)
            drill.mining_progress = math.min(drill.mining_progress, drill.mining_target.prototype.mineable_properties.mining_time)
        end
    end

    local burnerAssemblers = surface.find_entities_filtered({name = "burner-assembling-machine"});
    for _, assembler in ipairs(burnerAssemblers) do
        local isCrafting = assembler.is_crafting and assembler.active and assembler.burner.currently_burning and assembler.crafting_progress > 0
        local unitNumber = assembler.unit_number

        local fuelAccel = 1
        if (assembler.get_fuel_inventory()[1] ~= nil) then
            if (assembler.get_fuel_inventory()[1].valid_for_read) then
                fuelAccel = assembler.get_fuel_inventory()[1].prototype.fuel_acceleration_multiplier
            end
        end
    
        if (global["burner-speedups"]["burner-assembling-machine"][unitNumber] == nil) then
            global["burner-speedups"]["burner-assembling-machine"][unitNumber] = 0
        end

        local speedupValue = global["burner-speedups"]["burner-assembling-machine"][unitNumber]
        
        if (isCrafting) then
            global["burner-speedups"]["burner-assembling-machine"][unitNumber] = speedupValue + 0.0001666*fuelAccel
        end

        if (not isCrafting) then
            global["burner-speedups"]["burner-assembling-machine"][unitNumber] = speedupValue - 0.02
        end

        if (global["burner-speedups"]["burner-assembling-machine"][unitNumber] < 0) then
            global["burner-speedups"]["burner-assembling-machine"][unitNumber] = 0
        end
        if (global["burner-speedups"]["burner-assembling-machine"][unitNumber] > fuelAccel) then
            global["burner-speedups"]["burner-assembling-machine"][unitNumber] = fuelAccel
        end

        if (speedupValue > 0 and isCrafting) then
            local speed = assembler.prototype.crafting_speed
            local craftingTime = assembler.get_recipe().prototype.energy
            assembler.crafting_progress = math.min(assembler.crafting_progress + (((speedupValue * speed / craftingTime)) / 60), 1)
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
                    {type="item",       name="iron-plate",              quantity=1, next="x10"},
                    {type="item",       name="copper-plate",            quantity=1, next="x10"},
                    {type="item",       name="glass-plate",             quantity=1, next="x10"},
                    {type="item",       name="steel-plate",             quantity=1, next="x10"},
                    {type="item",       name="advanced-circuit",        quantity=1, next="x10"},
                    {type="item",       name="processing-unit",         quantity=1, next="x10"},

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