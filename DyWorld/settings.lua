
--settings.startup["DyWorld_Debug"].value
--settings.startup["DyWorld_Modules"].value
--settings.startup["DyWorld_Warfare"].value
--settings.startup["DyWorld_Warfare_Difficulty"].value
--settings.startup["DyWorld_Stack_Size_Mult"].value
--settings.startup["DyWorld_Tech_Increaser"].value
--settings.startup["DyWorld_Processing"].value
--settings.startup["DyWorld_Power"].value
--settings.startup["DyWorld_Logistics"].value
--settings.startup["DyWorld_Extraction"].value
--settings.startup["DyWorld_Equipment"].value

-- can use: "runtime-global", "startup"

data:extend({
	----- Debug Settings -----
	{
		type = "bool-setting",
		name = "DyWorld_Debug",
		setting_type = "startup",
		default_value = false,
	},
	{
		type = "bool-setting",
		name = "DyWorld_Debug_Extra",
		setting_type = "startup",
		default_value = false,
	},
	----- Content Altering Settings -----
	{
		type = "bool-setting",
		name = "DyWorld_Warfare",
		setting_type = "startup",
		default_value = true,
	},
	{
		type = "bool-setting",
		name = "DyWorld_Processing",
		setting_type = "startup",
		default_value = true,
	},
	{
		type = "bool-setting",
		name = "DyWorld_Power",
		setting_type = "startup",
		default_value = true,
	},
	{
		type = "bool-setting",
		name = "DyWorld_Logistics",
		setting_type = "startup",
		default_value = true,
	},
	{
		type = "bool-setting",
		name = "DyWorld_Extraction",
		setting_type = "startup",
		default_value = true,
	},
	{
		type = "bool-setting",
		name = "DyWorld_Equipment",
		setting_type = "startup",
		default_value = true,
	},
	{
		type = "bool-setting",
		name = "DyWorld_Decor",
		setting_type = "startup",
		default_value = true,
	},
	----- Game Altering Settings -----
	{
		type = "bool-setting",
		name = "DyWorld_Infinite_Resources",
		setting_type = "startup",
		default_value = false,
	},
	--[[{
		type = "bool-setting",
		name = "DyWorld_Heat_Pipe_Belt",
		setting_type = "startup",
		default_value = true,
	},]]--
	{
		type = "bool-setting",
		name = "DyWorld_Combat_Overhaul",
		setting_type = "startup",
		default_value = false,
	},
	{
		type = "bool-setting",
		name = "DyWorld_Expensive_Recipe_Helper",
		setting_type = "startup",
		default_value = false,
	},
	{
		type = "int-setting",
		name = "DyWorld_Warfare_Difficulty",
		setting_type = "startup",
		default_value = 2,
        maximum_value = 5,
        minimum_value = 1,
		allowed_values = Warfare_Modes,
        order = "DyWorld_Warfare_Difficulty"
	},
	{
		type = "int-setting",
		name = "DyWorld_Stack_Size_Mult",
		setting_type = "startup",
		default_value = 1,
        maximum_value = 4200000000,
        minimum_value = 1,
	},
	{
		type = "int-setting",
		name = "DyWorld_Expensive_Multiplier",
		setting_type = "startup",
		default_value = 2,
        maximum_value = 4200000000,
        minimum_value = 2,
	},
	{
		type = "int-setting",
		name = "DyWorld_Tech_Increaser",
		setting_type = "startup",
		default_value = 1,
        maximum_value = 1000000,
        minimum_value = 1,
	},
	----- Per Player Settings -----
    {
        type = "bool-setting",
        name = "DyWorld_Distance_Map_Tags",
		order = "a",
        setting_type = "runtime-per-user",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "DyWorld_Distance_Resource_Tags",
		order = "a",
        setting_type = "runtime-per-user",
        default_value = false
    },
    {
        type = "bool-setting",
        name = "DyWorld_Distance_Player_Tags",
		order = "a",
        setting_type = "runtime-per-user",
        default_value = false
    },
})

Warfare_Modes =
{ 1, 2, 3, 4, 5 }

