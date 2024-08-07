require("science")
require("util")

data.raw["recipe"]["steel-plate"].ingredients = {{"iron-plate", 4}, {"coal-coke", 2}}
data.raw["technology"]["steel-processing"].prerequisites = {"automation-science-pack", "coal-coke"}
data.raw["recipe"]["electronic-circuit"].ingredients = {{"glass-plate", 1}, {"copper-cable", 3}}
data.raw["recipe"]["electronic-circuit"].enabled = false;
data.raw["recipe"]["electronic-circuit"].allow_decomposition = false;
data.raw["recipe"]["electronic-circuit"].category = "advanced-crafting";
data.raw["technology"]["electronics"].prerequisites = {"glass-processing", "electricity"}

data.raw["technology"]["advanced-electronics"].prerequisites = {"plastics", "sulfur-processing"}
effects = data.raw["technology"]["advanced-electronics"].effects or {}
table.insert(effects, {type = "unlock-recipe", recipe = "alt-electronic-circuit-plastic"})
data.raw["technology"]["advanced-electronics"].effects = effects;

data.raw["recipe"]["advanced-circuit"].ingredients = {{"plastic-bar", 1}, {"electronic-circuit", 2}, {"copper-cable", 5}, {type = "fluid", name = "hydrochloric-acid", amount = 1}}
data.raw["recipe"]["advanced-circuit"].category = "crafting-with-fluid"

data.raw["recipe"]["solar-panel"].ingredients = {{"copper-plate", 15}, {"steel-plate", 5}, {"glass-plate", 15}}

--glass
data.raw["recipe"]["electric-furnace"].ingredients = {{"advanced-circuit", 5}, {"steel-plate", 5}, {"steel-furnace", 1}, {"glass-plate", 5}}
data.raw["recipe"]["chemical-plant"].ingredients = {{"electronic-circuit", 5}, {"steel-plate", 5}, {"glass-plate", 5}, {"pipe", 5}}
data.raw["recipe"]["storage-tank"].ingredients = {{"steel-plate", 5}, {"glass-plate", 10}, {"pipe", 5}}
data.raw["technology"]["fluid-handling"].prerequisites = {"engine"}
data.raw["recipe"]["engine-unit"].ingredients = {{"iron-gear-wheel", 1}, {"pipe", 3}, {"steel-plate", 1}}
data.raw["technology"]["engine"].prerequisites = {"logistic-science-pack", "steel-processing", "glass-processing"}

data.raw["recipe"]["pipe"].ingredients = {{"iron-plate", 1}, {"glass-plate", 1}}
data.raw["recipe"]["pipe"].results = {{"pipe", 2}}
data.raw["recipe"]["pipe"].enabled = false
data.raw["recipe"]["pipe-to-ground"].enabled = false

data.raw["recipe"]["low-density-structure"].ingredients =  {{"copper-plate", 15}, {"steel-plate", 2}, {"plastic-bar", 4}, {"glass-plate", 5}}

--module rework
data.raw["recipe"]["speed-module"].ingredients = {{"copper-cable", 40}, {"advanced-circuit", 5}};
data.raw["recipe"]["productivity-module"].ingredients = {{type = "fluid", name = "water", amount = 10}, {"explosives", 5}, {"advanced-circuit", 5}};
data.raw["technology"]["productivity-module"].prerequisites = {"modules", "explosives"}
data.raw["recipe"]["productivity-module"].category = "crafting-with-fluid"
data.raw["recipe"]["effectivity-module"].ingredients = {{"glass-plate", 5}, {"advanced-circuit", 5}};

data.raw["recipe"]["speed-module-2"].ingredients = {{"uranium-238", 1}, {"processing-unit", 5}, {"speed-module", 4}};
data.raw["technology"]["speed-module-2"].prerequisites = {"speed-module", "advanced-electronics-2", "uranium-processing"}
data.raw["recipe"]["productivity-module-2"].ingredients = {{type = "fluid", name = "steam", amount = 25},{"low-density-structure", 2}, {"processing-unit", 5}, {"productivity-module", 4}};
data.raw["technology"]["productivity-module-2"].prerequisites = {"productivity-module", "advanced-electronics-2", "low-density-structure"}
data.raw["recipe"]["productivity-module-2"].category = "crafting-with-fluid"
data.raw["recipe"]["effectivity-module-2"].ingredients = {{"electric-engine-unit", 4}, {"processing-unit", 5}, {"effectivity-module", 4}};
data.raw["technology"]["effectivity-module-2"].prerequisites = {"effectivity-module", "advanced-electronics-2", "electric-engine"}

data.raw["recipe"]["speed-module-3"].ingredients = {{"uranium-235", 1}, {"processing-unit", 5   }, {"speed-module-2", 4}};
data.raw["recipe"]["productivity-module-3"].ingredients = {{type = "fluid", name = "lubricant", amount = 50}, {"low-density-structure", 6}, {"processing-unit", 5}, {"productivity-module-2", 4}};
data.raw["recipe"]["productivity-module-3"].category = "crafting-with-fluid"
data.raw["recipe"]["effectivity-module-3"].ingredients = {{"flying-robot-frame", 4}, {"processing-unit", 5}, {"effectivity-module-2", 4}};
data.raw["technology"]["effectivity-module-3"].prerequisites = {"effectivity-module-2", "production-science-pack", "robotics"}

--nerf kovarex processing
data.raw["recipe"]["kovarex-enrichment-process"].ingredients = {{"uranium-235", 40}, {"uranium-238", 10}}

--expensive personal reactors
data.raw["recipe"]["fusion-reactor-equipment"].ingredients = {{"processing-unit", 150}, {"low-density-structure", 50}, {"uranium-fuel-cell", 10}}
data.raw["technology"]["fusion-reactor-equipment"].prerequisites = {"utility-science-pack", "uranium-processing", "power-armor", "military-science-pack"}


data.raw["recipe"]["burner-inserter"].ingredients = {{"iron-stick", 1}, {"iron-gear-wheel", 1}, {"iron-plate", 1}};
data.raw["recipe"]["inserter"].ingredients = {{"burner-inserter", 1}, {"electronic-circuit", 1}, {"iron-plate", 1}};
data.raw["recipe"]["long-handed-inserter"].ingredients = {{"inserter", 1}, {"iron-stick", 1}, {"iron-plate", 1}};

data.raw["mining-drill"]["burner-mining-drill"].resource_searching_radius = 1.99 --buff burner drill
data.raw["mining-drill"]["burner-mining-drill"].mining_speed = 0.35
data.raw["mining-drill"]["burner-mining-drill"].radius_visualisation_picture = {filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png", width = 10, height = 10}
data.raw["recipe"]["electric-mining-drill"].ingredients = {{"iron-plate", 5}, {"burner-mining-drill", 1}, {"electronic-circuit", 4}, {"iron-gear-wheel", 4}}
data.raw["mining-drill"]["burner-mining-drill"].allowed_effects = {"consumption", "speed", "pollution", "productivity"}

--buff burner nuclear fuel
--it's still worse than nuclear fuel cells. but it works I guess 
data.raw["item"]["nuclear-fuel"].fuel_value = "12.1GJ"

data.raw["recipe"]["lab"].ingredients = {{"iron-gear-wheel", 5}, {"electronic-circuit", 5}, {"burner-lab", 1}, {"transport-belt", 4}}
data.raw["recipe"]["assembling-machine-1"].ingredients = {{"iron-gear-wheel", 5}, {"electronic-circuit", 3}, {"burner-assembling-machine", 1}}

-------------------------FLUIDS-------------------------
data.raw["recipe"]["sulfuric-acid"].ingredients = {{"sulfur", 5}, {type = "fluid", name = "distilled-water", amount = 100}, {"iron-plate", 1}}
data.raw["recipe"]["plastic-bar"].ingredients = {{type = "fluid", name = "petroleum-gas", amount = 25}, {type = "fluid", name = "hydrochloric-acid", amount = 1}}
data.raw["recipe"]["plastic-bar"].results = {{"plastic-bar", 1}, {type = "fluid", name = "hydrogen", amount = 5}}
data.raw["recipe"]["plastic-bar"].main_product = "plastic-bar"

data.raw["recipe"]["heavy-oil-cracking"].ingredients = {{type = "fluid", name = "steam", amount = 50}, {type = "fluid", name = "heavy-oil", amount = 40}}
data.raw["recipe"]["light-oil-cracking"].ingredients = {{type = "fluid", name = "hydrogen", amount = 5}, {type = "fluid", name = "light-oil", amount = 30}}

data.raw["recipe"]["sulfur"].ingredients = {{type = "fluid", name = "crude-oil", amount = 20}, {type = "fluid", name = "steam", amount = 50}}
data.raw["recipe"]["sulfur"].results = {{"sulfur", 2}, {"coal", 1}, {type = "fluid", name = "crude-oil", amount = 5}, {type = "fluid", name = "distilled-water", amount = 40}}
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

data.raw["recipe"]["repair-pack"].ingredients = {{"copper-cable", 6}, {"iron-gear-wheel", 3}}

data.raw["recipe"]["steel-furnace"].ingredients = {{"steel-plate", 6}, {"stone-brick", 8}, {"stone-furnace", 1}};

--Text plates compatibility
if data.raw.item["textplate-small-glass"] then
    data.raw.recipe["textplate-small-glass"].ingredients = {{type = "item", name = "glass-plate", amount = 1}}
    data.raw.recipe["textplate-large-glass"].ingredients = {{type = "item", name = "glass-plate", amount = 4}}
end

--SIMULATIONS--

local menu_simulations = {} 
menu_simulations["burner-factory-1"] = {
    save = "__engineering-for-dummies__/simulation_saves/burner-factory-1.zip",
    checkboard = false,
    length = 60 * 60 * 2, --in ticks, so this is 2 minutes
    init = "game.camera_zoom = 1.75" --zoom out camera
}

menu_simulations["oil-factory-1"] = {
    save = "__engineering-for-dummies__/simulation_saves/oil-factory-1.zip",
    checkboard = false,
    length = 60 * 60 * 2, --in ticks, so this is 2 minutes
    init = "game.camera_zoom = 1.25" --zoom out camera
}

menu_simulations["oil-train-factory-1"] = {
    save = "__engineering-for-dummies__/simulation_saves/oil-train-factory-1.zip",
    checkboard = false,
    length = 60 * 60 * 2, --in ticks, so this is 2 minutes
    init = "game.camera_zoom = 1" --zoom out camera
}

data.raw["utility-constants"]["default"].main_menu_simulations = menu_simulations;