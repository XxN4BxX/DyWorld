require "data/core/functions/prefix"

local Data_Table_Item_Group = {
	{
		Name = "inserters",
		Type = "main",
		Icon = "inserters.png"
	},
	{
		Name = "inserter-1-simple",
		Type = "sub",
		Main = "inserters"
	},
	{
		Name = "inserter-2-heat",
		Type = "sub",
		Main = "inserters"
	},
	{
		Name = "inserter-2-basic",
		Type = "sub",
		Main = "inserters"
	},
	{
		Name = "inserter-2-filter",
		Type = "sub",
		Main = "inserters"
	},
	{
		Name = "inserter-2-long",
		Type = "sub",
		Main = "inserters"
	},
	{
		Name = "inserter-3-stack",
		Type = "sub",
		Main = "inserters"
	},
	{
		Name = "inserter-3-stack-filter",
		Type = "sub",
		Main = "inserters"
	},
}

function DyWorld_Item_Main_Group(NAME, ICON)
  local result =
  {
    type = "item-group",
    name = dy..NAME,
    icon = dyworld_path_item_group..ICON,
    icon_size = 64,
    order = "z-"..dy..NAME,
  }
  return result
end

function DyWorld_Item_Sub_Group(NAME, MAIN)
  local result =
  {
    type = "item-subgroup",
    name = dy..NAME,
    group = dy..MAIN,
    order = dy..NAME
  }
  return result
end

for k,v in pairs(Data_Table_Item_Group) do
	if v.Type == "main" then
		data:extend(
			{
				DyWorld_Item_Main_Group(v.Name, v.Icon)
			})
	elseif v.Type == "sub" then
		data:extend(
			{
				DyWorld_Item_Sub_Group(v.Name, v.Main)
			})
	end
end