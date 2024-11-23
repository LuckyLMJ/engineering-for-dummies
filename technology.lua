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
                }
            },
            unit =
            {
                count = 20,
                ingredients = {{"burner-science-pack", 1}},
                time = 10
            },
            prerequisites = {},
            order = "d-a"
        },
		{
			type = "technology",
			name = "coal-coke",
			icon_size = 64,
			icon_mipmaps = 4,
			icons = {
			  	{
					icon = "__base__/graphics/icons/coal-2.png",
					tint = {0.8, 0.8, 0.9}
				}
			},
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "coal-coke"
				}
			},
			unit =
			{
				count = 25,
				ingredients = {{"burner-science-pack", 1}},
				time = 10
			},
			prerequisites = {},
			order = "d-a"
	  	},
		{
			type = "technology",
			name = "ore-purification",
			icon_size = 64,
			icon_mipmaps = 4,
			icons = {
                {
                    icon = "__engineering-for-dummies__/graphics/icons/item/dust.png",
                    tint = {1, 0.5, 0.2}
                }
            },
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "crushed-iron-ore"
				},
				{
					type = "unlock-recipe",
					recipe = "crushed-copper-ore"
				},
				{
					type = "unlock-recipe",
					recipe = "crushed-iron-ore-smelting"
				},
				{
					type = "unlock-recipe",
					recipe = "crushed-copper-ore-smelting"
				},
				{
					type = "unlock-recipe",
					recipe = "waste-water-purification"
				}
			},
			unit =
		   {
				count = 200,
				ingredients = {{"burner-science-pack", 1}, {"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}},
				time = 20
			},
			prerequisites = {"advanced-material-processing-2", "advanced-oil-processing"},
			order = "e-a"
	  }
    }
)