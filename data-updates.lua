require("util")

--red sci
data.raw["recipe"]["automation-science-pack"].ingredients = {{"iron-gear-wheel", 2}, {"copper-cable", 6}};
data.raw["recipe"]["automation-science-pack"].enabled = false;

local labInputs = {"burner-science-pack"};
for _, thing in pairs(data.raw["lab"]["lab"].inputs) do
    table.insert(labInputs, thing);
end

data.raw["lab"]["lab"].inputs = labInputs;

data.raw["recipe"]["electronic-circuit"].enabled = false;
data.raw["recipe"]["electronic-circuit"].allow_decomposition = false;
data.raw["recipe"]["electronic-circuit"].category = "advanced-crafting";
data.raw["technology"]["electronics"].prerequisites = {"electricity"}

data.raw["technology"]["logistic-science-pack"].prerequisites = {"logistics", "automation"}
data.raw["technology"]["gun-turret"].prerequisites = {"military", "automation-science-pack"}
data.raw["technology"]["stone-wall"].prerequisites = {"military", "automation-science-pack"}


--we can't just add to the effects table if it doesn't exist (as in vanilla, the electronics research has no unlocks)
--so we have to make an empty table if it doesn't exist
local effects = data.raw["technology"]["electronics"].effects or {}
table.insert(effects, {type = "unlock-recipe", recipe = "electronic-circuit"})
data.raw["technology"]["electronics"].effects = effects;

--burner phase addition
data.raw["technology"]["automation"].prerequisites = {"electricity"}
data.raw["technology"]["optics"].prerequisites = {"electricity"}
data.raw["technology"]["logistics"].unit.ingredients = {{"burner-science-pack", 1}}
data.raw["technology"]["logistics"].unit.count = 25;
data.raw["technology"]["military"].unit.ingredients = {{"burner-science-pack", 1}}
data.raw["technology"]["military"].unit.count = 25;
data.raw["technology"]["automation"].unit.count = 100;
data.raw["recipe"]["splitter"].ingredients = {{"copper-plate", 5}, {"iron-gear-wheel", 3}, {"transport-belt", 2}}
data.raw["recipe"]["burner-mining-drill"].ingredients = {{"copper-plate", 2}, {"iron-plate", 5}, {"iron-gear-wheel", 5}, {"stone-furnace", 1}}

data.raw["recipe"]["inserter"].enabled = false;
data.raw["recipe"]["electric-mining-drill"].enabled = false;
data.raw["recipe"]["small-electric-pole"].enabled = false;
data.raw["recipe"]["steam-engine"].enabled = false;
data.raw["recipe"]["offshore-pump"].enabled = false;
data.raw["recipe"]["boiler"].enabled = false;
data.raw["recipe"]["lab"].enabled = false;

data.raw["inserter"]["burner-inserter"].rotation_speed = 0.0135;
data.raw["inserter"]["burner-inserter"].extension_speed = 0.03;
data.raw["inserter"]["burner-inserter"].energy_per_movement = "5KJ";
data.raw["inserter"]["burner-inserter"].energy_per_rotation = "5KJ";

data.raw["mining-drill"]["burner-mining-drill"].resource_searching_radius = 1.99 --buff burner drill
data.raw["mining-drill"]["burner-mining-drill"].mining_speed = 0.35
data.raw["mining-drill"]["burner-mining-drill"].radius_visualisation_picture = {filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png", width = 10, height = 10}
data.raw["mining-drill"]["burner-mining-drill"].allowed_effects = {"consumption", "speed", "pollution", "productivity"}

--make burner furnaces use heat mechanics

data.raw["furnace"]["stone-furnace"].crafting_speed = 0.5
data.raw["furnace"]["stone-furnace"].energy_usage = "60kW"
data.raw["furnace"]["stone-furnace"].allowed_effects = {"consumption", "speed", "productivity"}

data.raw["furnace"]["steel-furnace"].crafting_speed = 1
data.raw["furnace"]["steel-furnace"].energy_usage = "90kW"
data.raw["furnace"]["steel-furnace"].allowed_effects = {"consumption", "speed", "productivity"}

--nerf wood as fuel
data.raw["item"]["wood"].fuel_acceleration_multiplier = 0.5
data.raw["item"]["wood"].fuel_value = "500kJ"

for _, tech in pairs(data.raw.technology) do
    local doesBurnerExist = false;
    for _, ingredient in pairs(tech.unit.ingredients) do
        if (ingredient.name == "burner-science-pack" or ingredient[1] == "burner-science-pack") then
            doesBurnerExist = true;
            break;
        end
    end

    if (not doesBurnerExist) then
        table.insert(tech.unit.ingredients, {"burner-science-pack", 1})
    end
end

data.raw["recipe"]["repair-pack"].ingredients = {{"copper-cable", 6}, {"iron-gear-wheel", 3}}