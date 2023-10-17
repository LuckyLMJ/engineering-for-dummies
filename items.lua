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
        }
    }
)