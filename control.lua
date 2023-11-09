do
    -- don't load if sim scenario has already loaded this (in another lua state)
    local modloader = remote.interfaces["modloader"]    
    if modloader and modloader[script.mod_name] then
      return
    end
end

require("util")

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