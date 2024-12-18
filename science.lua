--red sci
data.raw["recipe"]["automation-science-pack"].ingredients = {{type = "item", name = "iron-gear-wheel", amount = 2}, {type = "item", name = "glass-plate", amount = 2}, {type = "item", name = "copper-cable", amount = 6}};
data.raw["recipe"]["automation-science-pack"].enabled = false;

--green sci
data.raw["recipe"]["logistic-science-pack"].ingredients = {{type = "item", name = "underground-belt", amount = 1}, {type = "item", name = "electronic-circuit", amount = 4}, {type = "item", name = "pipe", amount = 3}}
data.raw["recipe"]["logistic-science-pack"].energy_required = 12
data.raw["recipe"]["logistic-science-pack"].category = "crafting"
data.raw["recipe"]["logistic-science-pack"].results = {{type = "item", name = "logistic-science-pack", amount = 2}}
data.raw["technology"]["logistic-science-pack"].prerequisites = {"logistics", "automation"}

--mil sci
data.raw["recipe"]["military-science-pack"].ingredients = {{type = "item", name = "explosives", amount=2}, {type = "item", name = "stone-wall", amount=3}, {type = "item", name = "piercing-rounds-magazine", amount=1}}
data.raw["recipe"]["military-science-pack"].category = "crafting"
data.raw["recipe"]["military-science-pack"].energy_required = 16
data.raw["technology"]["military-science-pack"].prerequisites = {"stone-wall", "explosives", "military-2", "automation-2"}

--blue sci
data.raw["recipe"]["chemical-science-pack"].ingredients = {{type = "fluid", name = "sulfuric-acid", amount = 25}, {type = "item", name = "advanced-circuit", amount=3}, {type = "item", name = "engine-unit", amount = 1}}
data.raw["recipe"]["chemical-science-pack"].category = "crafting-with-fluid"
data.raw["recipe"]["engine-unit"].ingredients = {
    {type = "item", name = "steel-plate", amount = 1},
    {type = "item", name = "iron-gear-wheel", amount = 1},
    {type = "item", name = "iron-stick", amount = 2},
    {type = "item", name = "pipe", amount = 3}
}

--purple sci
data.raw["recipe"]["production-science-pack"].ingredients = {{type = "fluid", name = "lubricant", amount = 10}, {type = "item", name = "electric-furnace", amount=1}, {type = "item", name = "fast-transport-belt", amount = 4}, {type = "item", name = "uranium-238", amount=1}}
data.raw["recipe"]["production-science-pack"].category = "crafting-with-fluid"
data.raw["recipe"]["production-science-pack"].results = {{type = "item", name = "production-science-pack", amount=3}, {type = "item", name = "iron-plate", amount=2}}
data.raw["recipe"]["production-science-pack"].main_product = "production-science-pack"
data.raw["technology"]["production-science-pack"].prerequisites = {"lubricant", "advanced-material-processing-2", "logistics-2", "uranium-processing"}

--yellow sci
data.raw["recipe"]["utility-science-pack"].ingredients = {{type = "item", name = "refined-concrete", amount=8}, {type = "item", name = "processing-unit", amount = 3}, {type = "item", name = "flying-robot-frame", amount = 1}, {type = "item", name = "copper-cable", amount = 40}}
data.raw["technology"]["utility-science-pack"].prerequisites = {"concrete", "processing-unit", "robotics"}
data.raw["recipe"]["utility-science-pack"].category = "advanced-crafting"

--space science - materials
data.raw["recipe"]["rocket-fuel"].ingredients = {{type = "fluid", name = "light-oil", amount=10}, {type = "fluid", name = "oxygen", amount=100}, {type = "item", name = "solid-fuel", amount = 10}}
data.raw["recipe"]["rocket-fuel"].category = "chemistry"

--other tweaks
data.raw["technology"]["rocket-silo"].prerequisites = {"utility-science-pack", "production-science-pack", "rocketry", "solar-energy", "electric-energy-accumulators"}
data.raw["technology"]["rocket-silo"].unit.ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, 
                                                          {"chemical-science-pack", 1}, {"production-science-pack", 1},
                                                          {"utility-science-pack", 1}, {"military-science-pack", 1}}

table.insert(data.raw["technology"]["space-science-pack"].effects, {type = "unlock-recipe", recipe = "space-science-pack"})

data.raw["recipe"]["satellite"].ingredients = {{type = "fluid", name = "lubricant", amount=100}, {type = "item", name = "accumulator", amount = 90}, {type = "item", name = "solar-panel", amount = 90}, {type = "item", name = "processing-unit", amount = 90}, {type = "item", name = "radar", amount = 2}, {type = "item", name = "rocket-fuel", amount = 100}, {type = "item", name = "low-density-structure", amount = 100}}
data.raw["recipe"]["satellite"].category = "crafting-with-fluid"
                                                          
data.raw["item"]["satellite"].rocket_launch_products = {{type = "item", name = "space-probe-data", amount = 100}}