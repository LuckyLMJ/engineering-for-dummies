data:extend(
    {
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
              	time = 15
          	},
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
              	time = 20
          	},
          	prerequisites = {"automation-science-pack"},
          	order = "d-a"
        }
    }
)