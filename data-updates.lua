require("science")

data.raw["recipe"]["steel-plate"].ingredients = {{"iron-plate", 4}, {"coal", 2}}
data.raw["recipe"]["electronic-circuit"].ingredients = {{"glass-plate", 1}, {"copper-cable", 3}}
data.raw["recipe"]["electronic-circuit"].enabled = false;
data.raw["technology"]["electronics"].prerequisites = {"glass-processing"}

--we can't just add to the effects table if it doesn't exist (as in vanilla, the electronics research has no unlocks)
--so we have to make an empty table if it doesn't exist
local effects = data.raw["technology"]["electronics"].effects or {}
table.insert(effects, {type = "unlock-recipe", recipe = "electronic-circuit"})
data.raw["technology"]["electronics"].effects = effects;

data.raw["technology"]["advanced-electronics"].prerequisites = {"plastics", "sulfur-processing"}
effects = data.raw["technology"]["advanced-electronics"].effects or {}
table.insert(effects, {type = "unlock-recipe", recipe = "alt-electronic-circuit-plastic"})
data.raw["technology"]["advanced-electronics"].effects = effects;

data.raw["recipe"]["advanced-circuit"].ingredients = {{"plastic-bar", 1}, {"electronic-circuit", 2}, {"copper-cable", 5}, {type = "fluid", name = "sulfuric-acid", amount = 1}}
data.raw["recipe"]["advanced-circuit"].category = "crafting-with-fluid"

data.raw["recipe"]["solar-panel"].ingredients = {{"copper-plate", 15}, {"steel-plate", 5}, {"glass-plate", 15}}

--glass
data.raw["recipe"]["electric-furnace"].ingredients = {{"advanced-circuit", 5}, {"steel-plate", 10}, {"stone-brick", 10}, {"glass-plate", 5}}
data.raw["recipe"]["chemical-plant"].ingredients = {{"electronic-circuit", 5}, {"steel-plate", 5}, {"glass-plate", 5}, {"pipe", 5}}
data.raw["recipe"]["storage-tank"].ingredients = {{"steel-plate", 5}, {"glass-plate", 10}}
data.raw["technology"]["fluid-handling"].prerequisites = {"glass-processing"}
data.raw["recipe"]["engine-unit"].ingredients = {{"iron-gear-wheel", 1}, {"glass-plate", 1}, {"steel-plate", 1}}
data.raw["technology"]["engine"].prerequisites = {"logistic-science-pack", "steel-processing", "glass-processing"}

data.raw["recipe"]["pipe"].ingredients = {{"iron-plate", 1}, {"glass-plate", 1}}
data.raw["recipe"]["pipe"].results = {{"pipe", 2}}
data.raw["recipe"]["pipe"].enabled = false
data.raw["recipe"]["pipe-to-ground"].enabled = false

data.raw["recipe"]["boiler"].ingredients = {{"stone-furnace", 1}, {"iron-plate", 10}}
data.raw["recipe"]["steam-engine"].ingredients = {{"iron-plate", 10}, {"iron-gear-wheel", 5}, {"iron-stick", 5}}
data.raw["recipe"]["offshore-pump"].ingredients = {{"iron-plate", 5}, {"electronic-circuit", 3}, {"iron-gear-wheel", 3}}

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

data.raw["recipe"]["speed-module-3"].ingredients = {{"uranium-235", 1}, {"processing-unit", 5}, {"speed-module-2", 4}};
data.raw["recipe"]["productivity-module-3"].ingredients = {{type = "fluid", name = "lubricant", amount = 50}, {"low-density-structure", 6}, {"processing-unit", 5}, {"productivity-module-2", 4}};
data.raw["recipe"]["productivity-module-3"].category = "crafting-with-fluid"
data.raw["recipe"]["effectivity-module-3"].ingredients = {{"flying-robot-frame", 4}, {"processing-unit", 5}, {"effectivity-module-2", 4}};
data.raw["technology"]["effectivity-module-3"].prerequisites = {"effectivity-module-2", "production-science-pack", "robotics"}

--nerf kovarex processing
data.raw["recipe"]["kovarex-enrichment-process"].ingredients = {{"uranium-235", 40}, {"uranium-238", 10}}

--expensive personal reactors
data.raw["recipe"]["fusion-reactor-equipment"].ingredients = {{"processing-unit", 150}, {"low-density-structure", 50}, {"uranium-fuel-cell", 10}}
data.raw["technology"]["fusion-reactor-equipment"].prerequisites = {"utility-science-pack", "uranium-processing", "power-armor", "military-science-pack"}