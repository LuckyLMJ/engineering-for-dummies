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
                    icon = "__engineering-for-dummies__/graphics/icons/item/sand.png",
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
            name = "salt",
            icon_size = 64,
            icon_mipmaps = 4,
            icons = {
                {
                    icon = "__engineering-for-dummies__/graphics/icons/item/dust.png",
                    tint = {0.5, 1, 0.8}
                }
            },
            stack_size = 25,
            subgroup = "intermediate-product",
            order = "a[salt]",
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
            fuel_value = "10MJ",
            fuel_acceleration_multiplier = 1.1,
            fuel_top_speed_multiplier = 1.02,
            fuel_emissions_multiplier = 0.7
        },
        {
            type = "item",
            name = "crushed-iron-ore",
            icon_size = 64,
            icon_mipmaps = 4,
            icons = {
                {
                    icon = "__engineering-for-dummies__/graphics/icons/item/dust.png",
                    tint = {0.8, 0.8, 1}
                }
            },
            subgroup = "intermediate-product",
            order = "a[crushed-iron]",
            stack_size = 10,
        },
        {
            type = "item",
            name = "crushed-copper-ore",
            icon_size = 64,
            icon_mipmaps = 4,
            icons = {
                {
                    icon = "__engineering-for-dummies__/graphics/icons/item/dust.png",
                    tint = {1, 0.5, 0.2}
                }
            },
            subgroup = "intermediate-product",
            order = "a[crushed-copper-ore]",
            stack_size = 10,
        },
    }
)