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
                ingredients = {{"burner-science-pack", 1}},
                time = 5
            },
            prerequisites = {},
            order = "d-a"
        },
        {
          type = "technology",
          name = "automation-science-pack",
          icon_size = 64,
          icon_mipmaps = 4,
          icons = {
              {
                  icon = "__base__/graphics/icons/automation-science-pack.png",
                  tint = {1, 1, 1}
              }
          },
          effects =
          {
              {
                  type = "unlock-recipe",
                  recipe = "automation-science-pack"
              }
          },
          unit =
          {
              count = 50,
              ingredients = {{"burner-science-pack", 1}},
              time = 5
          },
          prerequisites = {"glass-processing"},
          order = "d-a"
        },
        {
          type = "technology",
          name = "electricity",
          icon_size = 64,
          icon_mipmaps = 4,
          icons = {
              {
                  icon = "__base__/graphics/icons/small-electric-pole.png",
                  tint = {1, 1, 1}
              }
          },
          effects =
          {
              {
                  type = "unlock-recipe",
                  recipe = "small-electric-pole"
              },
              {
                  type = "unlock-recipe",
                  recipe = "steam-engine"
              },
              {
                  type = "unlock-recipe",
                  recipe = "inserter"
              },
              {
                  type = "unlock-recipe",
                  recipe = "lab"
              },
              {
                  type = "unlock-recipe",
                  recipe = "electric-mining-drill"
              },
              {
                  type = "unlock-recipe",
                  recipe = "boiler"
              },
              {
                  type = "unlock-recipe",
                  recipe = "offshore-pump"
              },
              {
                  type = "unlock-recipe",
                  recipe = "alt-electronic-circuit-wood"
              }
          },
          unit =
          {
              count = 50,
              ingredients = {{"burner-science-pack", 1}, {"automation-science-pack", 1}},
              time = 10
          },
          prerequisites = {"automation-science-pack"},
          order = "d-a"
        }
    }
)