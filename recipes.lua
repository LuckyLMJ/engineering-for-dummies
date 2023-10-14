require("functions")

data:extend(
    {
        {
            type = "recipe",
            name = "space-science-pack",
            category = "advanced-crafting",
            enabled = false,
            energy_required = 100,
            ingredients = {
                {"space-probe-data", 1},
                {"iron-gear-wheel", 1},
                {"express-transport-belt", 1},
                {"advanced-circuit", 1},
                {"uranium-235", 1},
                {"flying-robot-frame", 1}
            },
            results = {{"space-science-pack", 10}, {"copper-cable", 7}, {"uranium-238", 1}},
            main_product = "space-science-pack"
        },
        {
            type = "recipe",
            name = "sand",
            category = "crafting",
            enabled = false,
            energy_required = 3,
            ingredients = {
                {"stone", 1}
            },
            results = {{"sand", 3}}
        },
        {
            type = "recipe",
            name = "glass-plate",
            category = "smelting",
            enabled = false,
            energy_required = 5,
            ingredients = {
                {"sand", 5}
            },
            results = {{"glass-plate", 1}}
        },
        {
            type = "recipe",
            name = "alt-electronic-circuit-wood",
            category = "crafting",
            enabled = true,
            energy_required = 0.5,
            ingredients = {
                {"wood", 1},
                {"copper-cable", 3}
            },
            results = {{"electronic-circuit", 1}}
        },
        {
            type = "recipe",
            name = "alt-electronic-circuit-plastic",
            category = "crafting-with-fluid",
            enabled = true,
            energy_required = 0.5,
            ingredients = {
                {"plastic-bar", 1},
                {type = "fluid", name = "sulfuric-acid", amount = 1},
                {"copper-cable", 5}
            },
            results = {{"electronic-circuit", 2}}
        }
    }
)

allowProductivity("space-science-pack")
allowProductivity("sand")
allowProductivity("glass-plate")