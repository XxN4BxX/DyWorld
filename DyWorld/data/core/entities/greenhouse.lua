require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

for i=1,Greenhouses_Amount do
data:extend(
{
  {
    type = "assembling-machine",
    name = "greenhouse-"..i,
	localised_name = {"looped-name.greenhouse", i},
    icons = 
	{
	  {
		icon = dyworld_path_icon.."greenhouse.png",
	    tint = Color_Tier[i],
	  },
	},
	icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "greenhouse-"..i},
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    max_health = 250 * (i*i),
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    fast_replaceable_group = "greenhouse",
    crafting_categories = {dy.."farming"},
    crafting_speed = 0.5 * (i + i),
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = (-0.25 * i),
    },
    energy_usage = math.floor(25 * (i*(i-(0.5/i)))).."W", --"25kW",
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
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, 2} }}
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
    name = "greenhouse-"..i,
	localised_name = {"looped-name.greenhouse", i},
    icons = 
	{
	  {
		icon = dyworld_path_icon.."greenhouse.png",
	    tint = Color_Tier[i],
	  },
	},
	icon_size = 32,
    flags = {},
    subgroup = dy.."greenhouse",
    order = Order_Tiers[i],
    place_result = "greenhouse-"..i,
    stack_size = 50
  },
  --@todo Change recipes greenhouse
  {
    type = "recipe",
    name = "greenhouse-"..i,
    energy_required = 5*i,
    enabled = true,
    ingredients =
    {
      {type = "item", name = "stone-plate", amount = 5},
      {type = "item", name = "wood", amount = 4},
      {type = "item", name = "simple-control-board", amount = 1},
    },
    result = "greenhouse-"..i
  },
}
)
	if i == 2 then 
		data.raw.recipe["greenhouse-"..i].ingredients = {}
		local Insert_Recipe = {type = "item", name = "electronic-control-board", amount = 2}
		table.insert(data.raw.recipe["greenhouse-"..i].ingredients, Insert_Recipe)
		local Insert_Recipe = {type = "item", name = "bronze-plate", amount = 10}
		table.insert(data.raw.recipe["greenhouse-"..i].ingredients, Insert_Recipe)
	end
	if i == 3 then 
		data.raw.recipe["greenhouse-"..i].ingredients = {}
		local Insert_Recipe = {type = "item", name = "tough-control-board", amount = 2}
		table.insert(data.raw.recipe["greenhouse-"..i].ingredients, Insert_Recipe)
		local Insert_Recipe = {type = "item", name = "cobalt-plate", amount = 15}
		table.insert(data.raw.recipe["greenhouse-"..i].ingredients, Insert_Recipe)
		local Insert_Recipe = {type = "item", name = "frame", amount = 1}
		table.insert(data.raw.recipe["greenhouse-"..i].ingredients, Insert_Recipe)
	end
	if i == 4 then 
		data.raw.recipe["greenhouse-"..i].ingredients = {}
		local Insert_Recipe = {type = "item", name = "logic-control-board", amount = 2}
		table.insert(data.raw.recipe["greenhouse-"..i].ingredients, Insert_Recipe)
		local Insert_Recipe = {type = "item", name = "titanium-plate", amount = 20}
		table.insert(data.raw.recipe["greenhouse-"..i].ingredients, Insert_Recipe)
		local Insert_Recipe = {type = "item", name = "heater", amount = 1}
		table.insert(data.raw.recipe["greenhouse-"..i].ingredients, Insert_Recipe)
	end
	if i == 5 then 
		data.raw.recipe["greenhouse-"..i].ingredients = {}
		local Insert_Recipe = {type = "item", name = "extreme-control-board", amount = 2}
		table.insert(data.raw.recipe["greenhouse-"..i].ingredients, Insert_Recipe)
		local Insert_Recipe = {type = "item", name = "tungstvar-plate", amount = 25}
		table.insert(data.raw.recipe["greenhouse-"..i].ingredients, Insert_Recipe)
		local Insert_Recipe = {type = "item", name = "housing", amount = 1}
		table.insert(data.raw.recipe["greenhouse-"..i].ingredients, Insert_Recipe)
	end
	if i >= 2 then 
		local Insert_Recipe = {type = "item", name = "greenhouse-"..(i-1), amount = 1}
		table.insert(data.raw.recipe["greenhouse-"..i].ingredients, Insert_Recipe)
	end
end

DyWorld_Add_To_Tech("farming-1", "greenhouse-1")
DyWorld_Add_To_Tech("farming-3", "greenhouse-2")
DyWorld_Add_To_Tech("farming-5", "greenhouse-3")
DyWorld_Add_To_Tech("automation-7", "greenhouse-4")
DyWorld_Add_To_Tech("automation-9", "greenhouse-5")