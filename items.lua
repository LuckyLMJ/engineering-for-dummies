function productivity_module_limitation()
    return {
        "sulfuric-acid",
        "basic-oil-processing",
        "advanced-oil-processing",
        "coal-liquefaction",
        "heavy-oil-cracking",
        "light-oil-cracking",
        "solid-fuel-from-light-oil",
        "solid-fuel-from-heavy-oil",
        "solid-fuel-from-petroleum-gas",
        "lubricant",
        "iron-plate",
        "copper-plate",
        "steel-plate",
        "stone-brick",
        "sulfur",
        "plastic-bar",
        "empty-barrel",
        "uranium-processing",
        "copper-cable",
        "iron-stick",
        "iron-gear-wheel",
        "electronic-circuit",
        "advanced-circuit",
        "processing-unit",
        "engine-unit",
        "electric-engine-unit",
        "uranium-fuel-cell",
        "explosives",
        "battery",
        "flying-robot-frame",
        "low-density-structure",
        "rocket-fuel",
        "nuclear-fuel",
        "nuclear-fuel-reprocessing",
        "rocket-control-unit",
        "rocket-part",
        "automation-science-pack",
        "logistic-science-pack",
        "chemical-science-pack",
        "military-science-pack",
        "production-science-pack",
        "utility-science-pack",
        "kovarex-enrichment-process"
    }
end
data:extend(
    {
        {
            type = "item",
            name = "space-probe-data",
            icon_size = 64,
            icon_mipmaps = 4,
            icons = {
                {
                    icon = "__base__/graphics/icons/rocket-control-unit.png",
                    tint = {1, 0.8, 1}
                }
            },
            stack_size = 100,
            subgroup = "intermediate-product"
        },
        {
            type = "item",
            name = "sand",
            icon_size = 64,
            icon_mipmaps = 4,
            icons = {
                {
                    icon = "__engineering-for-dummies__/graphics/icons/sand.png",
                    tint = {1, 1, 1}
                }
            },
            stack_size = 25,
            order = "a[sand]",
            subgroup = "intermediate-product"
        },
        {
            type = "item",
            name = "glass-plate",
            icon_size = 64,
            icon_mipmaps = 4,
            icons = {
                {
                    icon = "__base__/graphics/icons/iron-plate.png",
                    tint = {0.75, 0.8, 1, 0.5}
                }
            },
            stack_size = 100,
            order = "a[glass-plate]",
            subgroup = "intermediate-product"
        },
        {
            type = "item",
            name = "burner-assembling-machine",
            icons = {
                {
                icon = "__base__/graphics/icons/assembling-machine-1.png",
                tint = {1, 0.9, 0.7}
                }
            },
            icon_size = 64, icon_mipmaps = 4,
            subgroup = "production-machine",
            order = "a[assembling-machine-0]",
            place_result = "burner-assembling-machine",
            stack_size = 50
        },
        {
            type = "tool",
            name = "burner-science-pack",
            localised_description = {"item-description.science-pack"},
            icons = {
                {
                    icon = "__base__/graphics/icons/space-science-pack.png",
                    tint = {1, 0.5, 0.1}
                }
            },
            icon_size = 64, icon_mipmaps = 4,
            subgroup = "science-pack",
            order = "a[burner-science-pack]",
            stack_size = 200,
            durability = 1,
            durability_description_key = "description.science-pack-remaining-amount-key",
            durability_description_value = "description.science-pack-remaining-amount-value"
        },
        {
            type = "item",
            name = "burner-lab",
            icons = {
                {
                icon = "__base__/graphics/icons/lab.png",
                tint = {1, 0.9, 0.7}
                }
            },
            icon_size = 64, icon_mipmaps = 4,
            subgroup = "production-machine",
            order = "g[burner-lab]",
            place_result = "burner-lab",
            stack_size = 10
        },
        {
            type = "item",
            name = "salt",
            icon_size = 64,
            icon_mipmaps = 4,
            icons = {
                {
                    icon = "__engineering-for-dummies__/graphics/icons/sand.png",
                    tint = {0.7, 1, 1}
                }
            },
            stack_size = 25,
            subgroup = "intermediate-product",
            order = "a[salt]",
        },
        {
            type = "module",
            name = "burner-speed-module",
            localised_description = {"item-description.speed-module"},
            icon = "__base__/graphics/icons/speed-module.png",
            icon_size = 64, icon_mipmaps = 4,
            order = "a[speed]-a[burner-speed-module]",
            stack_size = 50,
            category = "speed",
            tier = 1,
            effect = {speed = {bonus = 0.1}, consumption = {bonus = 0.1}},
            flags = {"hidden"}
        },
        {
            type = "module",
            name = "burner-productivity-module",
            localised_description = {"item-description.productivity-module"},
            icon = "__base__/graphics/icons/productivity-module.png",
            icon_size = 64, icon_mipmaps = 4,
            order = "a[productivity]-a[burner-productivity-module]",
            stack_size = 50,
            category = "productivity",
            tier = 1,
            effect = {productivity = {bonus = 0.01}},
            limitation = productivity_module_limitation(),
            flags = {"hidden"}
        },
        {
            type = "item",
            name = "coal-coke",
            icon_size = 64,
            icon_mipmaps = 4,
            icons = {
                {
                    icon = "__base__/graphics/icons/stone-2.png",
                    tint = {0.35, 0.3, 0.3}
                }
            },
            subgroup = "intermediate-product",
            order = "a[coal-coke]",
            stack_size = 50,
            fuel_category = "chemical",
            fuel_value = "8MJ",
            fuel_acceleration_multiplier = 1.1,
            fuel_top_speed_multiplier = 1.02,
            fuel_emissions_multiplier = 0.7
        },
    }
)