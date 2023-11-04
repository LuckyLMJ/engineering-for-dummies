local sounds = require("__base__.prototypes.entity.sounds")

data:extend(
    {
        {
            type = "assembling-machine",
            name = "burner-assembling-machine",
            icon = "__engineering-for-dummies__/graphics/icons/item/burner-assembling-machine.png",
            icon_size = 64, icon_mipmaps = 4,
            flags = {"placeable-neutral", "placeable-player", "player-creation"},
            minable = {mining_time = 0.2, result = "burner-assembling-machine"},
            max_health = 300,
            corpse = "assembling-machine-1-remnants",
            dying_explosion = "assembling-machine-1-explosion",

            collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
            selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
            alert_icon_shift = util.by_pixel(-3, -12),
            animation = {
                tint = {1, 0.9, 0.7},
                layers = {
                    {
                        filename = "__engineering-for-dummies__/graphics/entity/burner-assembling-machine.png",
                        priority="high",
                        width = 108,
                        height = 114,
                        frame_count = 32,
                        line_length = 8,
                        shift = util.by_pixel(0, 2),
                    },
                    {
                        tint = {1, 0.9, 0.7},
                        filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1-shadow.png",
                        priority="high",
                        width = 95,
                        height = 83,
                        frame_count = 1,
                        line_length = 1,
                        repeat_count = 32,
                        draw_as_shadow = true,
                        shift = util.by_pixel(8.5, 5.5),
                        hr_version = {
                            tint = {1, 0.9, 0.7},
                            filename = "__base__/graphics/entity/assembling-machine-1/hr-assembling-machine-1-shadow.png",
                            priority="high",
                            width = 190,
                            height = 165,
                            frame_count = 1,
                            line_length = 1,
                            repeat_count = 32,
                            draw_as_shadow = true,
                            shift = util.by_pixel(8.5, 5),
                            scale = 0.5
                        }
                    }
                }
            },
            crafting_categories = {"burner-testing", "crafting"},
            crafting_speed = 0.5,
            energy_source = {
                type = "burner",
                fuel_category = "chemical",
                effectivity = 1,
                emissions_per_minute = 6,
                fuel_inventory_size = 1,
                light_flicker = {
                    color = {0,0,0},
                    minimum_intensity = 0.6,
                    maximum_intensity = 0.95
                }
            },
            energy_usage = "100kW",
            open_sound = sounds.machine_open,
            close_sound = sounds.machine_close,
            vehicle_impact_sound = sounds.generic_impact,
            working_sound = {
                sound = {
                    {
                        filename = "__base__/sound/steel-furnace.ogg",
                        volume = 0.4
                    }
                },
                audible_distance_modifier = 0.5,
                fade_in_ticks = 4,
                fade_out_ticks = 20
            },
            fast_replaceable_group = "assembling-machine",
            allowed_effects = {"consumption", "speed", "pollution", "productivity"}
        },
        {
            type = "beacon",
            name = "burner-beacon",
            icon = "__base__/graphics/icons/beacon.png",
            icon_size = 64, icon_mipmaps = 4,
            indestructible = true,
            collision_mask = {},
            collision_box = nil,
            selection_box = nil,
            allowed_effects = {"consumption", "speed", "pollution", "productivity"},
            flags = {"hidden", "not-deconstructable", "not-blueprintable", "not-flammable", "hide-alt-info", "placeable-off-grid"},
            energy_source = {
                type = "void"
            },
            energy_usage = "1kW",
            supply_area_distance = 0.1,
            distribution_effectivity = 1,
            module_specification = {
              module_slots = 100,
              module_info_icon_shift = {0, 0},
              module_info_multi_row_initial_height_modifier = -0.3,
              module_info_max_icons_per_row = 2
            }
        },
        {
            type = "lab",
            name = "burner-lab",
            icons = {
                {
                    icon = "__base__/graphics/icons/lab.png", 
                    tint = {1, 0.9, 0.7}
                }
            };
            icon_size = 64, icon_mipmaps = 4,
            flags = {"placeable-player", "player-creation"},
            minable = {mining_time = 0.2, result = "burner-lab"},
            max_health = 150,
            corpse = "lab-remnants",
            dying_explosion = "lab-explosion",
            collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
            selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
            on_animation =
            {
              layers =
              {
                {
                  filename = "__engineering-for-dummies__/graphics/entity/lab.png",
                  width = 98,
                  height = 87,
                  frame_count = 33,
                  line_length = 11,
                  animation_speed = 1 / 3,
                  shift = util.by_pixel(0, 1.5),
                  tint = {1, 0.9, 0.7}
                },
                {
                  filename = "__base__/graphics/entity/lab/lab-integration.png",
                  width = 122,
                  height = 81,
                  frame_count = 1,
                  line_length = 1,
                  repeat_count = 33,
                  animation_speed = 1 / 3,
                  shift = util.by_pixel(0, 15.5)
                },
                {
                  filename = "__base__/graphics/entity/lab/lab-light.png",
                  blend_mode = "additive",
                  draw_as_light = true,
                  width = 106,
                  height = 100,
                  frame_count = 33,
                  line_length = 11,
                  animation_speed = 1 / 3,
                  shift = util.by_pixel(-1, 1)
                },
                {
                  filename = "__base__/graphics/entity/lab/lab-shadow.png",
                  width = 122,
                  height = 68,
                  frame_count = 1,
                  line_length = 1,
                  repeat_count = 33,
                  animation_speed = 1 / 3,
                  shift = util.by_pixel(13, 11),
                  draw_as_shadow = true
                }
              }
            },
            off_animation =
            {
              layers =
              {
                {
                  filename = "__engineering-for-dummies__/graphics/entity/lab.png",
                  width = 98,
                  height = 87,
                  frame_count = 1,
                  shift = util.by_pixel(0, 1.5),
                  tint = {1, 0.9, 0.7}
                },
                {
                  filename = "__base__/graphics/entity/lab/lab-integration.png",
                  width = 122,
                  height = 81,
                  frame_count = 1,
                  shift = util.by_pixel(0, 15.5)
                },
                {
                  filename = "__base__/graphics/entity/lab/lab-shadow.png",
                  width = 122,
                  height = 68,
                  frame_count = 1,
                  shift = util.by_pixel(13, 11),
                  draw_as_shadow = true
                }
              }
            },
            working_sound =
            {
              sound =
              {
                filename = "__base__/sound/furnace.ogg",
                volume = 0.7
              },
              audible_distance_modifier = 0.7,
              fade_in_ticks = 4,
              fade_out_ticks = 20
            },
            vehicle_impact_sound = sounds.generic_impact,
            open_sound = sounds.machine_open,
            close_sound = sounds.machine_close,
            energy_source = {
                type = "burner",
                fuel_category = "chemical",
                effectivity = 1,
                emissions_per_minute = 4,
                fuel_inventory_size = 1,
                light_flicker = {
                    color = {0,0,0},
                    minimum_intensity = 0.6,
                    maximum_intensity = 0.95
                }
            },
            energy_usage = "50kW",
            researching_speed = 0.4,
            inputs = {"burner-science-pack", "automation-science-pack"},
            module_specification = {module_slots = 0},
            allowed_effects = {"consumption", "speed", "pollution", "productivity"}
        },
    }
)