require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

for i=1,Metallurgy_Machines_Amount do
data:extend(
{
  {
    type = "assembling-machine",
    name = "caster-"..i,
	localised_name = {"looped-name.caster", i},
    icons = 
	{
	  {
		icon = dyworld_path_icon.."greenhouse.png",
	    tint = Color_Tier[i],
	  },
	},
	icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "caster-"..i},
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    max_health = 250 * (i*i),
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    fast_replaceable_group = "caster",
    crafting_categories = {dy.."casting"},
    crafting_speed = 0.5 * (i + i),
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = (0.25 * (i*i)),
    },
    energy_usage = math.floor(750 * (i*(i-(0.5/i)))).."W", --"25kW",
    ingredient_count = 25,
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -2} }}
      },
    },
    module_specification =
    {
      module_slots = 0
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    animation =
    {
      filename = dyworld_path_entity.."greenhouse.png",
      width = 113,
      height = 91,
      frame_count = 1,
      shift = {0.2, 0.15},
	  tint = Color_Tier[i],
    },
    working_visualisations =
    {
      {
        light = {intensity = 1, size = 6},
        animation =
        {
          filename = dyworld_path_entity.."greenhouse-light.png",
          width = 113,
          height = 91,
          frame_count = 1,
          shift = {0.2, 0.15}
        }
      }
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  },
  {
    type = "item",
    name = "caster-"..i,
	localised_name = {"looped-name.caster", i},
    icons = 
	{
	  {
		icon = dyworld_path_icon.."greenhouse.png",
	    tint = Color_Tier[i],
	  },
	},
	icon_size = 32,
    flags = {},
    subgroup = dy.."machine-caster",
    order = Order_Tiers[i],
    place_result = "caster-"..i,
    stack_size = 50
  },
  {
    type = "recipe",
    name = "caster-"..i,
    energy_required = 5*i,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 5*i},
      {type = "item", name = "copper-plate", amount = 4*i},
      {type = "item", name = "stone", amount = 2*i},
    },
    result = "caster-"..i
  },
}
)
	local Insert_Recipe = {type = "item", name = "caster-"..(i-1), amount = 1}
	if i >= 2 then 
		table.insert(data.raw.recipe["caster-"..i].ingredients, Insert_Recipe)
	end
end