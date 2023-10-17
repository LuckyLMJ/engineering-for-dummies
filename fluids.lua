data:extend(
    {
        {
            type = "fluid",
            name = "distilled-water",
            default_temperature = 15,
            max_temperature = 100,
            heat_capacity = "0.2KJ",
            base_color = {r=0, g=0.34, b=0.6},
            flow_color = {r=0.7, g=0.7, b=0.8},
            icons = {
                {
                    icon = "__base__/graphics/icons/fluid/water.png",
                    tint = {0.8, 0.8, 1}
                }
            },
            icon_size = 64,
            icon_mipmaps = 4,
            order = "a[fluid]-a[distilled-water]"
        },
        {
            type = "fluid",
            name = "chlorine",
            default_temperature = 15,
            max_temperature = 999,
            gas_temperature = -34,
            heat_capacity = "0.05KJ",
            base_color = {r=0.2, g=0.6, b=0.3},
            flow_color = {r=0.4, g=0.9, b=0.6},
            icons = {
                {
                    icon = "__base__/graphics/icons/fluid/steam.png",
                    tint = {0.8, 1, 0.8}
                }
            },
            icon_size = 64,
            icon_mipmaps = 4,
            order = "a[fluid]-a[chlorine]"
        },
        {
            type = "fluid",
            name = "hydrochloric-acid",
            default_temperature = 15,
            max_temperature = 100,
            heat_capacity = "0.15KJ",
            base_color = {r=0, g=0.5, b=0.5},
            flow_color = {r=0.5, g=0.8, b=0.7},
            icons = {
                {
                    icon = "__base__/graphics/icons/fluid/water.png",
                    tint = {0.8, 1, 0.8}
                }
            },
            icon_size = 64,
            icon_mipmaps = 4,
            order = "a[fluid]-a[hydrochloric-acid]"
        },
        {
            type = "fluid",
            name = "hydrogen",
            default_temperature = 15,
            max_temperature = 999,
            gas_temperature = -250,
            heat_capacity = "0.05KJ",
            base_color = {r=0.9, g=0, b=0},
            flow_color = {r=1, g=0.5, b=0.5},
            icons = {
                {
                    icon = "__base__/graphics/icons/fluid/steam.png",
                    tint = {1, 0.8, 0.8}
                }
            },
            icon_size = 64,
            icon_mipmaps = 4,
            order = "a[fluid]-a[hydrogen]"
        },
        {
            type = "fluid",
            name = "oxygen",
            default_temperature = 15,
            max_temperature = 999,
            gas_temperature = -150,
            heat_capacity = "0.05KJ",
            base_color = {r=0, g=0, b=0.9},
            flow_color = {r=0.5, g=0.5, b=1},
            icons = {
                {
                    icon = "__base__/graphics/icons/fluid/steam.png",
                    tint = {0.8, 0.8, 1}
                }
            },
            icon_size = 64,
            icon_mipmaps = 4,
            order = "a[fluid]-a[oxygen]"
        }
    }
)