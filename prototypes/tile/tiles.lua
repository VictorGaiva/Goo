
data:extend(
{
  {
    type = "tile",
    name = "goo",
    --needs_correction = false, --It may need correction
    collision_mask = {"ground-tile"},
    walking_speed_modifier = 1 - goo_walking_speed_penalty,
    layer = 70, --Higher layers. Don't know if it is right yet
    variants =
    {
      main =
      {
        {
          picture = "__Goo__/graphics/terrain/goo/goo1.png",
          count = 16,
          size = 1
        },
        {
          picture = "__Goo__/graphics/terrain/goo/goo2.png",
          count = 4,
          size = 2,
          probability = 0.39,
        },
        {
          picture = "__Goo__/graphics/terrain/goo/goo4.png",
          count = 4,
          size = 4,
          probability = 1,
        },
      },
      inner_corner =
      {
        picture = "__Goo__/graphics/terrain/goo/goo-inner-corner.png",
        count = 8
      },
      outer_corner =
      {
        picture = "__Goo__/graphics/terrain/goo/goo-outer-corner.png",
        count = 8
      },
      side =
      {
        picture = "__Goo__/graphics/terrain/goo/goo-side.png",
        count = 8
      },
      u_transition =
      {
        picture = "__Goo__/graphics/terrain/goo/goo-u.png",
        count = 8
      },
      o_transition =
      {
        picture = "__Goo__/graphics/terrain/goo/goo-o.png",
        count = 1
      }
    },
    walking_sound =
    {
      {
        filename = "__Goo__/sound/walking/goo-01.ogg",
        volume = 1.2
      },
      {
        filename = "__Goo__/sound/walking/goo-02.ogg",
        volume = 1.2
      },
      {
        filename = "__Goo__/sound/walking/goo-03.ogg",
        volume = 1.2
      },
      {
        filename = "__Goo__/sound/walking/goo-04.ogg",
        volume = 1.2
      }
    },
    map_color={r=100, g=100, b=100},--CHANGE maybe
    ageing=0,--WTF is this?
    vehicle_friction_modifier = 1 + goo_vehicle_friction_bonus--more friction
  },
})
