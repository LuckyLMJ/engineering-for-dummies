data:extend(
    {
        {
            type = "technology",
            name = "glass-processing",
            icon_size = 64,
            icon_mipmaps = 4,
            icons = {
                {
                    icon = "__base__/graphics/icons/iron-plate.png",
                    tint = {0.75, 0.8, 1, 0.5}
                }
            },
            effects =
            {
              {
                type = "unlock-recipe",
                recipe = "sand"
              },
              {
                type = "unlock-recipe",
                recipe = "glass-plate"
              },
              {
                type = "unlock-recipe",
                recipe = "pipe"
              },
              {
                type = "unlock-recipe",
                recipe = "pipe-to-ground"
              }
            },
            unit =
            {
              count = 20,
              ingredients = {{"automation-science-pack", 1}},
              time = 5
            },
            prerequisites = {"automation"},
            order = "d-a"
        }
    }
)