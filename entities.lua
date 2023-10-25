local sounds = require("__base__.prototypes.entity.sounds")

data:extend(
    {
        {
            type = "assembling-machine",
            name = "burner-assembling-machine",
            icon = "__base__/graphics/icons/assembling-machine-1.png",
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
                        tint = {1, 0.9, 0.7},
                        filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1.png",
                        priority="high",
                        width = 108,
                        height = 114,
                        frame_count = 32,
                        line_length = 8,
                        shift = util.by_pixel(0, 2),
                        hr_version =
                        {
                            tint = {1, 0.9, 0.7},
                            filename = "__base__/graphics/entity/assembling-machine-1/hr-assembling-machine-1.png",
                            priority="high",
                            width = 214,
                            height = 226,
                            frame_count = 32,
                            line_length = 8,
                            shift = util.by_pixel(0, 2),
                            scale = 0.5
                        }
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
            collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
            selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
            allowed_effects = {"consumption", "speed", "pollution", "productivity"},
            flags = {"hidden", "not-deconstructable", "not-blueprintable", "not-flammable", "hide-alt-info"},
            energy_source = {
                type = "void"
            },
            energy_usage = "1kW",
            supply_area_distance = 0.1,
            distribution_effectivity = 1,
            module_specification = {
              module_slots = 50,
              module_info_icon_shift = {0, 0},
              module_info_multi_row_initial_height_modifier = -0.3,
              module_info_max_icons_per_row = 2
            }
        },
    }
)

local burnerLab = table.deepcopy(data.raw["lab"]["lab"]);
burnerLab.name = "burner-lab";
burnerLab.energy_source = {
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
                          }
burnerLab.on_animation.layers[1].tint = {1, 0.9, 0.7};
burnerLab.off_animation.layers[1].tint = {1, 0.9, 0.7};
burnerLab.on_animation.layers[1].hr_version.tint = {1, 0.9, 0.7};
burnerLab.off_animation.layers[1].hr_version.tint = {1, 0.9, 0.7};

burnerLab.icons = {{icon = burnerLab.icon, tint = {1, 0.9, 0.7}}};
burnerLab.icon = nil;

burnerLab.researching_speed = 0.75;
burnerLab.module_specification = {module_slots = 0};
burnerLab.inputs = {"burner-science-pack", "automation-science-pack"};
burnerLab.minable = {mining_time = 0.2, result = "burner-lab"}
data:extend({burnerLab});