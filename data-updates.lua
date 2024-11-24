require("science")
require("util")

data.raw["recipe"]["iron-stick"].enabled = true

data.raw["recipe"]["steel-plate"].ingredients = {{type = "item", name = "iron-plate", amount = 4}, {type = "item", name = "coal-coke", amount = 2}}
data.raw["technology"]["steel-processing"].prerequisites = {"automation-science-pack", "coal-coke"}
data.raw["recipe"]["electronic-circuit"].ingredients = {{type = "item", name = "glass-plate", amount = 1}, {type = "item", name = "copper-cable", amount = 3}}
data.raw["recipe"]["electronic-circuit"].enabled = false;
data.raw["recipe"]["electronic-circuit"].allow_decomposition = false;
data.raw["recipe"]["electronic-circuit"].category = "advanced-crafting";
data.raw["technology"]["electronics"].prerequisites = {"steam-power"}
data.raw["technology"]["steam-power"].prerequisites = {"glass-processing", "automation-science-pack"};

data.raw["technology"]["advanced-circuit"].prerequisites = {"plastics", "sulfur-processing"}
effects = data.raw["technology"]["advanced-circuit"].effects or {}
table.insert(effects, {type = "unlock-recipe", recipe = "alt-electronic-circuit-plastic"})
data.raw["technology"]["advanced-circuit"].effects = effects;

data.raw["recipe"]["advanced-circuit"].ingredients = {{type = "item", name = "plastic-bar", amount = 1}, {type = "item", name = "electronic-circuit", amount = 2}, {type = "item", name = "copper-cable", amount = 5}, {type = "fluid", name = "hydrochloric-acid", amount = 1}}
data.raw["recipe"]["advanced-circuit"].category = "crafting-with-fluid"

data.raw["recipe"]["solar-panel"].ingredients = {{type = "item", name = "copper-plate", amount = 15}, {type = "item", name = "steel-plate", amount = 5}, {type = "item", name = "glass-plate", amount = 15}}

--glass
data.raw["recipe"]["electric-furnace"].ingredients = {{type = "item", name = "advanced-circuit", amount = 5}, {type = "item", name = "steel-plate", amount = 5}, {type = "item", name = "steel-furnace", amount = 1}, {type = "item", name = "glass-plate", amount = 5}}
data.raw["recipe"]["chemical-plant"].ingredients = {{type = "item", name = "electronic-circuit", amount = 5}, {type = "item", name = "steel-plate", amount = 5}, {type = "item", name = "glass-plate", amount = 5}, {type = "item", name = "pipe", amount = 5}}
data.raw["recipe"]["storage-tank"].ingredients = {{type = "item", name = "steel-plate", amount = 5}, {type = "item", name = "glass-plate", amount = 10}, {type = "item", name = "pipe", amount = 5}}
data.raw["technology"]["fluid-handling"].prerequisites = {"engine"}
data.raw["recipe"]["engine-unit"].ingredients = {{type = "item", name = "iron-gear-wheel", amount = 1}, {type = "item", name = "pipe", amount = 3}, {type = "item", name = "steel-plate", amount = 1}}
data.raw["technology"]["engine"].prerequisites = {"logistic-science-pack", "steel-processing", "glass-processing"}

data.raw["recipe"]["pipe"].ingredients = {{type = "item", name = "iron-plate", amount = 1}, {type = "item", name = "glass-plate", amount = 1}}
data.raw["recipe"]["pipe"].results = {{type = "item", name = "pipe", amount = 2}}
data.raw["recipe"]["pipe"].enabled = false
data.raw["recipe"]["pipe-to-ground"].enabled = false

data.raw["recipe"]["low-density-structure"].ingredients =  {{type = "item", name = "copper-plate", amount = 15}, {type = "item", name = "steel-plate", amount = 2}, {type = "item", name = "plastic-bar", amount = 4}, {type = "item", name = "glass-plate", amount = 5}}

--module rework
data.raw["recipe"]["speed-module"].ingredients = {{type = "item", name = "copper-cable", amount = 40}, {type = "item", name = "advanced-circuit", amount = 5}};
data.raw["recipe"]["productivity-module"].ingredients = {{type = "fluid", name = "water", amount = 10}, {type = "item", name = "explosives", amount = 5}, {type = "item", name = "advanced-circuit", amount = 5}};
data.raw["technology"]["productivity-module"].prerequisites = {"modules", "explosives"}
data.raw["recipe"]["productivity-module"].category = "crafting-with-fluid"
data.raw["recipe"]["efficiency-module"].ingredients = {{type = "item", name = "glass-plate", amount = 5}, {type = "item", name = "advanced-circuit", amount = 5}};

data.raw["recipe"]["speed-module-2"].ingredients = {{type = "item", name = "uranium-238", amount = 1}, {type = "item", name = "processing-unit", amount = 5}, {type = "item", name = "speed-module", amount = 4}};
data.raw["technology"]["speed-module-2"].prerequisites = {"speed-module", "processing-unit", "uranium-processing"}
data.raw["recipe"]["productivity-module-2"].ingredients = {{type = "fluid", name = "steam", amount = 25},{type = "item", name = "low-density-structure", amount = 2}, {type = "item", name = "processing-unit", amount = 5}, {type = "item", name = "productivity-module", amount = 4}};
data.raw["technology"]["productivity-module-2"].prerequisites = {"productivity-module", "processing-unit", "low-density-structure"}
data.raw["recipe"]["productivity-module-2"].category = "crafting-with-fluid"
data.raw["recipe"]["efficiency-module-2"].ingredients = {{type = "item", name = "electric-engine-unit", amount = 4}, {type = "item", name = "processing-unit", amount = 5}, {type = "item", name = "efficiency-module", amount = 4}};
data.raw["technology"]["efficiency-module-2"].prerequisites = {"efficiency-module", "processing-unit", "electric-engine"}

data.raw["recipe"]["speed-module-3"].ingredients = {{type = "item", name = "uranium-235", amount = 1}, {type = "item", name = "processing-unit", amount = 5}, {type = "item", name = "speed-module-2", amount = 4}};
data.raw["recipe"]["productivity-module-3"].ingredients = {{type = "fluid", name = "lubricant", amount = 50}, {type = "item", name = "low-density-structure", amount = 6}, {type = "item", name = "processing-unit", amount = 5}, {type = "item", name = "productivity-module-2", amount = 4}};
data.raw["recipe"]["productivity-module-3"].category = "crafting-with-fluid"
data.raw["recipe"]["efficiency-module-3"].ingredients = {{type = "item", name = "flying-robot-frame", amount = 4}, {type = "item", name = "processing-unit", amount = 5}, {type = "item", name = "efficiency-module-2", amount = 4}};
data.raw["technology"]["efficiency-module-3"].prerequisites = {"efficiency-module-2", "production-science-pack", "robotics"}

--nerf kovarex processing
data.raw["recipe"]["kovarex-enrichment-process"].ingredients = {{type = "item", name = "uranium-235", amount = 40}, {type = "item", name = "uranium-238", amount = 10}}

data.raw["recipe"]["burner-inserter"].ingredients = {{type = "item", name = "iron-stick", amount = 1}, {type = "item", name = "iron-gear-wheel", amount = 1}, {type = "item", name = "iron-plate", amount = 1}};
data.raw["recipe"]["inserter"].ingredients = {{type = "item", name = "burner-inserter", amount = 1}, {type = "item", name = "electronic-circuit", amount = 1}, {type = "item", name = "iron-plate", amount = 1}};
data.raw["recipe"]["long-handed-inserter"].ingredients = {{type = "item", name = "inserter", amount = 1}, {type = "item", name = "iron-stick", amount = 1}, {type = "item", name = "iron-plate", amount = 1}};

data.raw["recipe"]["electric-mining-drill"].ingredients = {{type = "item", name = "iron-plate", amount = 5}, {type = "item", name = "burner-mining-drill", amount = 1}, {type = "item", name = "electronic-circuit", amount = 4}, {type = "item", name = "iron-gear-wheel", amount = 4}}

--buff burner nuclear fuel
--it's still worse than nuclear fuel cells. but it works I guess 
data.raw["item"]["nuclear-fuel"].fuel_value = "12.1GJ"

data.raw["recipe"]["lab"].ingredients = {{type = "item", name = "iron-gear-wheel", amount = 5}, {type = "item", name = "electronic-circuit", amount = 5}, {type = "item", name = "burner-lab", amount = 1}, {type = "item", name = "transport-belt", amount = 4}}
data.raw["recipe"]["assembling-machine-1"].ingredients = {{type = "item", name = "iron-gear-wheel", amount = 5}, {type = "item", name = "electronic-circuit", amount = 3}, {type = "item", name = "burner-assembling-machine", amount = 1}}

-------------------------FLUIDS-------------------------
data.raw["recipe"]["sulfuric-acid"].ingredients = {{type = "item", name = "sulfur", amount = 5}, {type = "fluid", name = "distilled-water", amount = 100}, {type = "item", name = "iron-plate", amount = 1}}
data.raw["recipe"]["plastic-bar"].ingredients = {{type = "fluid", name = "petroleum-gas", amount = 25}, {type = "fluid", name = "hydrochloric-acid", amount = 1}}
data.raw["recipe"]["plastic-bar"].results = {{type = "item", name = "plastic-bar", amount = 1}, {type = "fluid", name = "hydrogen", amount = 5}}
data.raw["recipe"]["plastic-bar"].main_product = "plastic-bar"

data.raw["recipe"]["heavy-oil-cracking"].ingredients = {{type = "fluid", name = "steam", amount = 50}, {type = "fluid", name = "heavy-oil", amount = 40}}
data.raw["recipe"]["light-oil-cracking"].ingredients = {{type = "fluid", name = "hydrogen", amount = 5}, {type = "fluid", name = "light-oil", amount = 30}}

data.raw["recipe"]["sulfur"].ingredients = {{type = "fluid", name = "crude-oil", amount = 20}, {type = "fluid", name = "steam", amount = 50}}
data.raw["recipe"]["sulfur"].results = {{type = "item", name = "sulfur", amount = 2}, {type = "item", name = "coal", amount = 1}, {type = "fluid", name = "crude-oil", amount = 5}, {type = "fluid", name = "distilled-water", amount = 40}}
data.raw["recipe"]["sulfur"].main_product = "sulfur"

data.raw["recipe"]["lubricant"].ingredients = {{type = "fluid", name = "heavy-oil", amount = 10}, {type = "fluid", name = "chlorine", amount = 1}}

--add effects to techs
local effects = data.raw["technology"]["fluid-handling"].effects or {}
table.insert(effects, {type = "unlock-recipe", recipe = "water-condensation"})
table.insert(effects, {type = "unlock-recipe", recipe = "dump-distilled-water"})
table.insert(effects, {type = "unlock-recipe", recipe = "oxygen-from-air"})
table.insert(effects, {type = "unlock-recipe", recipe = "water-from-hydrogen-oxygen"})
table.insert(effects, {type = "unlock-recipe", recipe = "water-electrolysis"})
table.insert(effects, {type = "unlock-recipe", recipe = "chemical-plant"})
table.insert(effects, {type = "unlock-recipe", recipe = "hydrochloric-acid"})
table.insert(effects, {type = "unlock-recipe", recipe = "chlorine"})
table.insert(effects, {type = "unlock-recipe", recipe = "dump-saltwater"})
data.raw["technology"]["fluid-handling"].effects = effects;

local effects = data.raw["technology"]["oil-processing"].effects or {}
table.insert(effects, {type = "unlock-recipe", recipe = "petrogas-from-hydrogen-coal"})
data.raw["technology"]["oil-processing"].effects = effects;

data.raw["recipe"]["repair-pack"].ingredients = {{type = "item", name = "copper-cable", amount = 6}, {type = "item", name = "iron-gear-wheel", amount = 3}}

data.raw["recipe"]["steel-furnace"].ingredients = {{type = "item", name = "steel-plate", amount = 6}, {type = "item", name = "stone-brick", amount = 8}, {type = "item", name = "stone-furnace", amount = 1}};

--Text plates compatibility
if data.raw.item["textplate-small-glass"] then
    data.raw.recipe["textplate-small-glass"].ingredients = {{type = "item", name = "glass-plate", amount = 1}}
    data.raw.recipe["textplate-large-glass"].ingredients = {{type = "item", name = "glass-plate", amount = 4}}
end


data.raw.technology["steam-power"].research_trigger = {
    type = "craft-item",
    item = "glass-plate",
    count = 50
}

--SIMULATIONS--

--local menu_simulations = {} 
--menu_simulations["burner-factory-1"] = {
--    save = "__engineering-for-dummies__/simulation_saves/burner-factory-1.zip",
--    checkboard = false,
--    length = 60 * 30, --in ticks, so this is 0.5 minutes
--    init = "game.camera_zoom = 1.75" --zoom out camera    
--}

--menu_simulations["oil-factory-1"] = {
--    save = "__engineering-for-dummies__/simulation_saves/oil-factory-1.zip",
--    checkboard = false,
--    length = 60 * 60 * 2, --in ticks, so this is 2 minutes
--    init = "game.camera_zoom = 1.25" --zoom out camera
--}

--menu_simulations["oil-train-factory-1"] = {
--    save = "__engineering-for-dummies__/simulation_saves/oil-train-factory-1.zip",
--    checkboard = false,
--    length = 60 * 60 * 2, --in ticks, so this is 2 minutes
--    init = "game.camera_zoom = 1" --zoom out camera
--}

--data.raw["utility-constants"]["default"].main_menu_simulations = menu_simulations;