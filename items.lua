data:extend(
    {
        {
            type = "item",
            name = "space-probe-data",
            icon_size = 64,
            icon_mipmaps = 4,
            icons = {
                {
                    icon = "__base__/graphics/icons/plastic-bar.png",
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