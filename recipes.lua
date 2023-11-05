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
            energy_required = 1.5,
            ingredients = {
                {"stone", 1}
            },
            results = {{"sand", 3}}
        },
        {
            type = "recipe",
            name = "charcoal",
            category = "smelting",
            enabled = true,
            energy_required = 10,
            ingredients = {
                {"wood", 5}
            },
            results = {{"coal", 1}},
            allow_decomposition = false,
        },
        {
            type = "recipe",
            name = "coal-coke",
            category = "smelting",
            enabled = false,
            energy_required = 15,
            ingredients = {
                {"coal", 3}
            },
            results = {{"coal-coke", 2}}
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
            results = {{"glass-plate", 1}},
            allow_decomposition = false
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
        {
            type = "recipe",
            name = "water-condensation",
            category = "chemistry",
            enabled = false,
            energy_required = 5,
            ingredients = {
                {type = "fluid", name = "steam", amount = 10},
            },
            results = {{type = "fluid", name = "distilled-water", amount = 10}}
        },
        {
            type = "recipe",
            name = "water-electrolysis",
            category = "chemistry",
            enabled = false,
            energy_required = 15,
            ingredients = {
                {type = "fluid", name = "water", amount = 10},
            },
            results = {{type = "fluid", name = "hydrogen", amount = 20}, {type = "fluid", name = "oxygen", amount = 10}, {type = "item", name = "salt", amount = 1}},
            main_product = "salt"
        },
        {
            type = "recipe",
            name = "chlorine",
            category = "chemistry",
            enabled = false,
            energy_required = 3,
            ingredients = {
                {type = "fluid", name = "distilled-water", amount = 10},
                {type = "item", name = "salt", amount = 1},
            },
            results = {{type = "fluid", name = "chlorine", amount = 10}, {type = "fluid", name = "steam", amount = 5, temperature = 120}},
            main_product = "chlorine"
        },
        {
            type = "recipe",
            name = "hydrochloric-acid",
            category = "chemistry",
            enabled = false,
            energy_required = 1,
            ingredients = {
                {type = "fluid", name = "distilled-water", amount = 10},
                {type = "fluid", name = "chlorine", amount = 10},
            },
            results = {{type = "fluid", name = "hydrochloric-acid", amount = 10}}
        },
        {
            type = "recipe",
            name = "water-from-hydrogen-oxygen",
            category = "chemistry",
            enabled = false,
            energy_required = 0.5,
            ingredients = {
                {type = "fluid", name = "oxygen", amount = 10},
                {type = "fluid", name = "hydrogen", amount = 20},
            },
            results = {{type = "fluid", name = "distilled-water", amount = 10}}
        },
        {
            type = "recipe",
            name = "petrogas-from-hydrogen-coal",
            category = "chemistry",
            enabled = false,
            energy_required = 5,
            ingredients = {
                {type = "fluid", name = "hydrogen", amount = 40},
                {type = "item", name = "coal", amount = 2},
            },
            results = {{type = "fluid", name = "petroleum-gas", amount = 10}}
        },
        {
            type = "recipe",
            name = "oxygen-from-air",
            category = "chemistry",
            enabled = false,
            energy_required = 0.5,
            ingredients = {
            },
            results = {{type = "fluid", name = "oxygen", amount = 2}}
        },
        {
            type = "recipe",
            name = "dump-distilled-water",
            category = "crafting-with-fluid",
            enabled = false,
            energy_required = 0.2,
            ingredients = {
                {type = "fluid", name = "distilled-water", amount = 10}
            },
            results = {},
            icons = {
                {
                    icon = "__base__/graphics/icons/fluid/steam.png",
                    tint = {0.4, 0.4, 1}
                }
            },
            icon_size = 64,
            icon_mipmaps = 4,
            subgroup = "fluid"
        },
        {
            type = "recipe",
            name = "dump-water",
            category = "crafting-with-fluid",
            enabled = false,
            energy_required = 0.2,
            ingredients = {
                {type = "fluid", name = "water", amount = 10}
            },
            results = {},
            icons = {
                {
                    icon = "__base__/graphics/icons/fluid/steam.png",
                    tint = {0.4, 0.5, 1}
                }
            },
            icon_size = 64,
            icon_mipmaps = 4,
            subgroup = "fluid"
        },
        {
            type = "recipe",
            name = "vent-oxygen",
            category = "crafting-with-fluid",
            enabled = false,
            energy_required = 0.05,
            ingredients = {
                {type = "fluid", name = "oxygen", amount = 100}
            },
            results = {},
            icons = {
                {
                    icon = "__base__/graphics/icons/fluid/steam.png",
                    tint = {0.2, 0.2, 1}
                }
            },
            icon_size = 64,
            icon_mipmaps = 4,
            subgroup = "fluid"
        },
        {
            type = "recipe",
            name = "dump-saltwater",
            category = "crafting-with-fluid",
            enabled = false,
            energy_required = 0.25,
            ingredients = {
                {type = "fluid", name = "water", amount = 100},
                {type = "item", name = "salt", amount = 1}
            },
            results = {},
            icons = {
                {
                    icon = "__base__/graphics/icons/fluid/water.png",
                    tint = {1, 1, 0.6}
                }
            },
            icon_size = 64,
            icon_mipmaps = 4,
            subgroup = "fluid"
        },
        {
            type = "recipe",
            name = "waste-water-purification",
            category = "chemistry",
            enabled = false,
            energy_required = 3,
            ingredients = {
                {type = "fluid", name = "waste-water", amount = 10},
                {type = "fluid", name = "hydrochloric-acid", amount = 1}
            },
            results = {{"sand", 1}, {type = "fluid", name = "waste-water", amount = 5}, {type = "fluid", name = "water", amount = 2}},
            main_product = "waste-water"
        },
        {
            type = "recipe",
            name = "crushed-iron-ore",
            category = "crafting-with-fluid",
            enabled = false,
            energy_required = 1.5,
            ingredients = {
                {"iron-ore", 1},
                {type = "fluid", name = "sulfuric-acid", amount = 1}
            },
            results = {{"crushed-iron-ore", 3}, {type = "item", name = "salt", amount = 1, probability = 0.1}, {type = "fluid", name = "waste-water", amount = 1}},
            main_product = "crushed-iron-ore"
        },
        {
            type = "recipe",
            name = "crushed-copper-ore",
            category = "crafting-with-fluid",
            enabled = false,
            energy_required = 1.5,
            ingredients = {
                {"copper-ore", 1},
                {type = "fluid", name = "hydrochloric-acid", amount = 1}
            },
            results = {{"crushed-copper-ore", 3}, {type = "item", name = "sulfur", amount = 1, probability = 0.1}, {type = "fluid", name = "waste-water", amount = 1}},
            main_product = "crushed-copper-ore"
        },
        {
            type = "recipe",
            name = "crushed-iron-ore-smelting",
            category = "smelting",
            enabled = false,
            energy_required = 7,
            ingredients = {
                {"crushed-iron-ore", 8},
                {"coal-coke", 1}
            },
            results = {{"iron-plate", 5}},
            allow_decomposition = false
        },
        {
            type = "recipe",
            name = "crushed-copper-ore-smelting",
            category = "smelting",
            enabled = false,
            energy_required = 7,
            ingredients = {
                {"crushed-copper-ore", 8},
                {"sand", 3}
            },
            results = {{"copper-plate", 5}},
            allow_decomposition = false
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
allowProductivity("charcoal")
allowProductivity("coal-coke")
allowProductivity("alt-electronic-circuit-plastic")
allowProductivity("alt-electronic-circuit-wood")
allowProductivity("water-condensation")
allowProductivity("water-electrolysis")
allowProductivity("chlorine")
allowProductivity("hydrochloric-acid")
allowProductivity("petrogas-from-hydrogen-coal")

allowProductivity("crushed-iron-ore")
allowProductivity("crushed-copper-ore")
allowProductivity("waste-water-purification")
allowProductivity("crushed-iron-ore-smelting")
allowProductivity("crushed-copper-ore-smelting")