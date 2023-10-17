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
            enabled = false,
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
            enabled = false,
            energy_required = 0.5,
            ingredients = {
                {"plastic-bar", 1},
                {type = "fluid", name = "sulfuric-acid", amount = 1},
                {"copper-cable", 5}
            },
            results = {{"electronic-circuit", 2}}
        },
        {
            type = "recipe",
            name = "burner-science-pack",
            category = "burner-testing",
            enabled = true,
            energy_required = 4,
            ingredients = {
                {"stone-brick", 1},
                {"iron-plate", 1}
            },
            results = {{"burner-science-pack", 1}}
        },
        {
            type = "recipe",
            name = "burner-lab",
            category = "crafting",
            enabled = true,
            energy_required = 3,
            ingredients = {
                {"iron-plate", 20},
                {"stone-brick", 4},
                {"iron-gear-wheel", 3},
                {"stone-furnace", 1}
            },
            results = {{"burner-lab", 1}}
        },
        {
            type = "recipe",
            name = "burner-assembling-machine",
            category = "crafting",
            enabled = true,
            energy_required = 3,
            ingredients = {
                {"iron-plate", 10},
                {"copper-cable", 4},
                {"stone-brick", 4},
                {"stone-furnace", 1}
            },
            results = {{"burner-assembling-machine", 1}}
        },
    }
)

data:extend(
    {
        {
            type = "recipe-category",
            name = "burner-testing"
        }
    }
)

allowProductivity("space-science-pack")
allowProductivity("sand")
allowProductivity("glass-plate")
allowProductivity("burner-science-pack")