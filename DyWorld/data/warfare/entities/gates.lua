require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Wall then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("gate", "gate", v.DyWorld.Name.."-gate", true)
	DyWorld_Prototype_Entity.localised_name = {"looped-name.wall-2", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Entity.max_health = Round((150 * (math.exp(v.DyWorld.Tier) * 0.2)), 0)
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.vertical_animation.layers[1].tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.vertical_animation.layers[1].hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.horizontal_animation.layers[1].tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.horizontal_animation.layers[1].hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.horizontal_rail_animation_left.layers[1].tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.horizontal_rail_animation_left.layers[1].hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.horizontal_rail_animation_right.layers[1].tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.horizontal_rail_animation_right.layers[1].hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.vertical_rail_animation_left.layers[1].tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.vertical_rail_animation_left.layers[1].hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.vertical_rail_animation_right.layers[1].tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.vertical_rail_animation_right.layers[1].hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.wall_patch.layers[1].tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.wall_patch.layers[1].hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.vertical_rail_base.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.vertical_rail_base.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.horizontal_rail_base.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.horizontal_rail_base.hr_version.tint = Material_Colors[v.DyWorld.Name]
	
	DyWorld_Prototype_Entity.fast_replaceable_group = "wall"
	if v.DyWorld.Entity.Wall.Next then
		DyWorld_Prototype_Entity.next_upgrade = v.DyWorld.Entity.Wall.Next.."-gate"
	end
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = "__base__/graphics/icons/gate.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "gate", v.DyWorld.Name.."-gate", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.wall-2", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.stack_size = 200
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/gate.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "gate", v.DyWorld.Name.."-gate", true)
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {}
	DyWorld_Prototype_Recipe.normal.result = v.DyWorld.Name.."-gate"
	DyWorld_Prototype_Recipe.expensive.ingredients = {}
	DyWorld_Prototype_Recipe.expensive.result = v.DyWorld.Name.."-gate"
	DyWorld_Prototype_Recipe.ingredients = nil
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.wall-2", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Recipe.energy_required = 0
	DyWorld_Prototype_Recipe.normal.energy_required = (2 * v.DyWorld.Tier) * v.DyWorld.Tier
	DyWorld_Prototype_Recipe.expensive.energy_required = (2 * v.DyWorld.Tier) * v.DyWorld.Tier
	if v.DyWorld.Tier == 1 then 
		DyWorld_Prototype_Recipe.enabled = true
		DyWorld_Prototype_Recipe.normal.enabled = true
		DyWorld_Prototype_Recipe.expensive.enabled = true
	else
		DyWorld_Prototype_Recipe.enabled = false
		DyWorld_Prototype_Recipe.normal.enabled = false
		DyWorld_Prototype_Recipe.expensive.enabled = false
	end

	data:extend({DyWorld_Prototype_Entity, DyWorld_Prototype_Item, DyWorld_Prototype_Recipe})
	
	if data.raw.technology["defensive-structures-"..v.DyWorld.Tier] then
		DyWorld_Add_To_Tech("defensive-structures-"..v.DyWorld.Tier, v.DyWorld.Name.."-gate")
	end
	
	if v.DyWorld.Entity.Wall.Gate_Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Wall.Gate_Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			local Ingredient_2 = {type = "item", name = q, amount = Expensive_Check(a)}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-gate"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-gate"].expensive.ingredients, Ingredient_2)
		end
	end
	if v.DyWorld.Entity.Wall.Previous then
		if v.DyWorld.Entity.Wall.Previous == "stone" then
			local Ingredient = {type = "item", name = "gate", amount = 1}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-gate"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-gate"].expensive.ingredients, Ingredient)
		else
			local Ingredient = {type = "item", name = v.DyWorld.Entity.Wall.Previous.."-gate", amount = 1}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-gate"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-gate"].expensive.ingredients, Ingredient)
		end
	end
end
end