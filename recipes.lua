require("functions")

data:extend(
    {
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
            results = {{"electronic-circuit", 1}},
            allow_decomposition = false
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

allowProductivity("burner-science-pack")
allowProductivity("alt-electronic-circuit-wood")