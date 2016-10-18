require ("prototypes.entity.demo-spawner-animation")
--require ("prototypes.entity.demo-biter-animations")
--require ("prototypes.entity.demo-enemy-sounds")
--require ("prototypes.entity.spitter-animations")
--require ("prototypes.entity.demo-enemy-autoplace-utils")

goo_spitter_spawner_tint = {r=0.09, g=0.29, b=0.49, a=1}


data:extend(
{

-- Unit Spawner
  {
    type = "unit-spawner",
    name = "goo-spitter-spawner",
    icon = "__base__/graphics/icons/biter-spawner.png",
    flags = {"placeable-player", "placeable-enemy", "not-repairable"},
    max_health = 450,
    order="b-b-h",
    subgroup="enemies",
    working_sound = {
      sound =
      {
        {
          filename = "__base__/sound/creatures/spawner.ogg",
          volume = 1.0
        }
      },
      apparent_volume = 2
    },
    dying_sound =
    {
      {
        filename = "__base__/sound/creatures/spawner-death-1.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/creatures/spawner-death-2.ogg",
        volume = 1.0
      }
    },
    resistances =
    {
      {
        type = "physical",
        decrease = 2,
      },
      {
        type = "explosion",
        decrease = 5,
        percent = 15,
      },
      {-- More fire resistence
        type = "fire",
        decrease = 2,
        percent = 85,
      }
    },
    healing_per_tick = 0.04, -- +100% health regain
    collision_box = {{-3.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-3.5, -2.5}, {2.5, 2.5}},
    pollution_absorbtion_absolute = 20,
    pollution_absorbtion_proportional = 0.01,
    corpse = "spitter-spawner-corpse",
    dying_explosion = "blood-explosion-huge",--CHANGE
    loot =
    {
      {
        count_max = 15,
        count_min = 5,
        item = "alien-artifact",
        probability = 1
      }
    },
    max_count_of_owned_units = 7,
    max_friends_around_to_spawn = 5,
    animations =
    {
      spawner_idle_animation(0, goo_spitter_spawner_tint),
      spawner_idle_animation(1, goo_spitter_spawner_tint),
      spawner_idle_animation(2, goo_spitter_spawner_tint),
      spawner_idle_animation(3, goo_spitter_spawner_tint)
    },

    --CHANGE maybe?
    result_units = (function()
                     local res = {}
                     res[1] = {"small-biter", {{0.0, 0.3}, {0.35, 0}}}
                     res[2] = {"small-spitter", {{0.25, 0.0}, {0.5, 0.3}, {0.7, 0.0}}}
                     res[3] = {"medium-spitter", {{0.5, 0.0}, {0.7, 0.3}, {0.9, 0.1}}}
                     res[4] = {"big-spitter", {{0.5, 0.0}, {1.0, 0.4}}}
                     res[5] = {"behemoth-spitter", {{0.9, 0.0}, {1.0, 0.3}}}
                     return res
                   end)(),
    -- With zero evolution the spawn rate is 6 seconds, with max evolution it is 2.5 seconds
    spawning_cooldown = {360, 150},
    spawning_radius = 10,
    spawning_spacing = 3,
    max_spawn_shift = 0,
    max_richness_for_spawn_shift = 100,
    autoplace = enemy_spawner_autoplace(1),
    call_for_help_radius = 50
  },
-- Spitter Spawner corpse
  {
    type = "corpse",
    name = "goo-spitter-spawner-corpse",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map", "not-on-map"},
    icon = "__base__/graphics/icons/biter-spawner-corpse.png",
    collision_box = {{-2, -2}, {2, 2}},
    selection_box = {{-2, -2}, {2, 2}},
    selectable_in_game = false,
    dying_speed = 0.04,
    time_before_removed = 15 * 60 * 60,
    subgroup="corpses",
    order = "c[corpse]-c[spitter-spawner]",
    final_render_layer = "corpse",
    animation =
    {
      spawner_die_animation(0, goo_spitter_spawner_tint),
      spawner_die_animation(1, goo_spitter_spawner_tint),
      spawner_die_animation(2, goo_spitter_spawner_tint),
      spawner_die_animation(3, goo_spitter_spawner_tint)
    }
  },
})
