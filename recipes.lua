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
                {type = "item", name = "space-probe-data", amount = 1},
                {type = "item", name = "iron-gear-wheel", amount = 1},
                {type = "item", name = "express-transport-belt", amount = 1},
                {type = "item", name = "advanced-circuit", amount = 1},
                {type = "item", name = "uranium-235", amount = 1},
                {type = "item", name = "flying-robot-frame", amount = 1}
            },
            results = {{type = "item", name = "space-science-pack", amount = 10}, {type = "item", name = "copper-cable", amount = 7}},
            main_product = "space-science-pack"
        },
        {
            type = "recipe",
            name = "sand",
            category = "crafting",
            enabled = false,
            energy_required = 1,
            ingredients = {
                {type = "item", name = "stone", amount = 1}
            },
            results = {{type = "item", name = "sand", amount = 3}}
        },
        {
            type = "recipe",
            name = "charcoal",
            category = "smelting",
            enabled = true,
            energy_required = 10,
            ingredients = {
                {type = "item", name = "wood", amount = 5}
            },
            results = {{type = "item", name = "coal", amount = 1}},
            allow_decomposition = false,
        },
        {
            type = "recipe",
            name = "coal-coke",
            category = "smelting",
            enabled = false,
            energy_required = 15,
            ingredients = {
                {type = "item", name = "coal", amount = 3}
            },
            results = {{type = "item", name = "coal-coke", amount = 2}}
        },
        {
            type = "recipe",
            name = "glass-plate",
            category = "smelting",
            enabled = false,
            energy_required = 5,
            ingredients = {
                {type = "item", name = "sand", amount = 5}
            },
            results = {{type = "item", name = "glass-plate", amount = 1}},
            allow_decomposition = false
        },
        {
            type = "recipe",
            name = "alt-electronic-circuit-plastic",
            category = "crafting-with-fluid",
            enabled = false,
            energy_required = 0.5,
            ingredients = {
                {type = "item", name = "plastic-bar", amount = 1},
                {type = "fluid", name = "sulfuric-acid", amount = 1},
                {type = "item", name = "copper-cable", amount = 5}
            },
            results = {{type = "item", name = "electronic-circuit", amount = 2}},
            allow_decomposition = false
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
            energy_required = 30,
            ingredients = {
                {type = "fluid", name = "waste-water", amount = 100},
                {type = "fluid", name = "hydrochloric-acid", amount = 10}
            },
            results = {{type = "item", name = "sand", amount = 10}, {type = "item", name = "crushed-iron-ore", amount = 1}, {type = "item", name = "crushed-copper-ore", amount = 1}, {type = "fluid", name = "chlorine", amount = 9}, {type = "fluid", name = "water", amount = 95}},
            icons = {
                {
                    icon = "__base__/graphics/icons/fluid/water.png",
                    tint = {0.8, 0.4, 0.2}
                }
            },
            icon_size = 64,
            icon_mipmaps = 4,
            subgroup = "fluid"
        },
        {
            type = "recipe",
            name = "crushed-iron-ore",
            category = "crafting-with-fluid",
            enabled = false,
            energy_required = 1.5,
            ingredients = {
                {type = "item", name = "iron-ore", amount = 1},
                {type = "fluid", name = "sulfuric-acid", amount = 1}
            },
            results = {{type = "item", name = "crushed-iron-ore", amount = 3}, {type = "item", name = "salt", amount = 1, probability = 0.1}, {type = "fluid", name = "waste-water", amount = 1}},
            main_product = "crushed-iron-ore"
        },
        {
            type = "recipe",
            name = "crushed-copper-ore",
            category = "crafting-with-fluid",
            enabled = false,
            energy_required = 1.5,
            ingredients = {
                {type = "item", name = "copper-ore", amount = 1},
                {type = "fluid", name = "hydrochloric-acid", amount = 1}
            },
            results = {{type = "item", name = "crushed-copper-ore", amount = 3}, {type = "item", name = "sulfur", amount = 1, probability = 0.1}, {type = "fluid", name = "waste-water", amount = 1}},
            main_product = "crushed-copper-ore"
        },
        {
            type = "recipe",
            name = "crushed-iron-ore-smelting",
            category = "smelting",
            enabled = false,
            energy_required = 7,
            ingredients = {
                {type = "item", name = "crushed-iron-ore", amount = 8},
                {type = "item", name = "coal-coke", amount = 1}
            },
            results = {{type = "item", name = "iron-plate", amount = 5}},
            allow_decomposition = false
        },
        {
            type = "recipe",
            name = "crushed-copper-ore-smelting",
            category = "smelting",
            enabled = false,
            energy_required = 7,
            ingredients = {
                {type = "item", name = "crushed-copper-ore", amount = 8},
                {type = "item", name = "sand", amount = 3}
            },
            results = {{type = "item", name = "copper-plate", amount = 5}},
            allow_decomposition = false
        },
    }
)

allowProductivity("space-science-pack")
allowProductivity("sand")
allowProductivity("glass-plate")
allowProductivity("charcoal")
allowProductivity("coal-coke")
allowProductivity("alt-electronic-circuit-plastic")
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