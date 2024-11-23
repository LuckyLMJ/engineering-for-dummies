data:extend(
    {
        {
            type = "fluid",
            name = "distilled-water",
            default_temperature = 15,
            max_temperature = 100,
            heat_capacity = "0.2kJ",
            base_color = {r=0, g=0.34, b=0.6},
            flow_color = {r=0.7, g=0.7, b=0.8},
            icon = "__engineering-for-dummies__/graphics/icons/fluid/distilled-water.png",
            icon_size = 64,
            icon_mipmaps = 4,
            order = "a[fluid]-a[distilled-water]"
        },
        {
            type = "fluid",
            name = "waste-water",
            default_temperature = 15,
            max_temperature = 100,
            heat_capacity = "0.2kJ",
            base_color = {r=0.6, g=0.5, b=0.3},
            flow_color = {r=0.8, g=0.7, b=0.3},
            icons = {
                {
                    icon = "__base__/graphics/icons/fluid/water.png",
                    tint = {0.8, 0.4, 0.2}
                }
            },
            icon_size = 64,
            icon_mipmaps = 4,
            order = "a[fluid]-a[waste-water]"
        },
        {
            type = "fluid",
            name = "chlorine",
            default_temperature = 15,
            max_temperature = 999,
            gas_temperature = -34,
            heat_capacity = "0.05kJ",
            base_color = {r=0.2, g=0.6, b=0.3},
            flow_color = {r=0.4, g=0.9, b=0.6},
            icon = "__engineering-for-dummies__/graphics/icons/fluid/chlorine.png",
            icon_size = 64,
            icon_mipmaps = 4,
            order = "a[fluid]-a[chlorine]"
        },
        {
            type = "fluid",
            name = "hydrochloric-acid",
            default_temperature = 15,
            max_temperature = 100,
            gas_temperature = 108,
            heat_capacity = "0.15kJ",
            base_color = {r=0, g=0.5, b=0.5},
            flow_color = {r=0.5, g=0.8, b=0.7},
            icon = "__engineering-for-dummies__/graphics/icons/fluid/hydrochloric-acid.png",
            icon_size = 64,
            icon_mipmaps = 4,
            order = "a[fluid]-a[hydrochloric-acid]"
        },
        {
            type = "fluid",
            name = "hydrogen",
            default_temperature = 15,
            max_temperature = 999,
            gas_temperature = -253,
            heat_capacity = "0.05kJ",
            base_color = {r=0.7, g=0.7, b=0.7},
            flow_color = {r=1, g=1, b=1},
            icon = "__engineering-for-dummies__/graphics/icons/fluid/hydrogen.png",
            icon_size = 64,
            icon_mipmaps = 4,
            order = "a[fluid]-a[hydrogen]"
        },
        {
            type = "fluid",
            name = "oxygen",
            default_temperature = 15,
            max_temperature = 999,
            gas_temperature = -183,
            heat_capacity = "0.05kJ",
            base_color = {r=0.7, g=0, b=0},
            flow_color = {r=1, g=0.5, b=0.5},
            icon = "__engineering-for-dummies__/graphics/icons/fluid/oxygen.png",
            icon_size = 64,
            icon_mipmaps = 4,
            order = "a[fluid]-a[oxygen]"
        }
    }
)