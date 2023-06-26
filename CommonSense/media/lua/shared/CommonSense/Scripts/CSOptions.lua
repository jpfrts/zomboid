local Settings = {

	options = {
		box1 = true,
		box2 = true,
		box3 = false,
	  },

	  names = {
		box1 = getText("IGUI_Settings_Prying_Mechanic"),
		box2 = getText("IGUI_Settings_Part_Condition_Highlighter"),
		box3 = getText("IGUI_Settings_Color_Filter"),
	  },

	  mod_id = "BB_CommonSense",
	  mod_shortname = "Common Sense",
}

if ModOptions and ModOptions.getInstance then
    local settings = ModOptions:getInstance(Settings)

	-- Apply tooltips
	settings:getData("box1").tooltip = getText("IGUI_Settings_Tooltip_Prying_Mechanic")
	settings:getData("box2").tooltip = getText("IGUI_Settings_Tooltip_Part_Condition_Highlighter")
	settings:getData("box3").tooltip = getText("IGUI_Settings_Tooltip_Colorblind_Mode")
end

CommonSense = {}
CommonSense.Settings = Settings
CommonSense.PryingTools = {"Base.Crowbar"}

--- Add an item (Equipable ONLY) to the list of items that can be used to pry stuff open.
---@param toolID string
CommonSense.AddPryingTool = function(toolID)
	table.insert(CommonSense.PryingTools, toolID)
	print("Added tool to list successfuly!")
end

--- Remove an item from the list of items that can be used to pry stuff open.
---@param toolID string
CommonSense.RemovePryingTool = function(toolID)

	  for k, v in pairs(CommonSense.PryingTools) do
		if v == toolID then
			table.remove(CommonSense.PryingTools, k)
			break
		end
  	end

	print("Removed tool from list successfuly!")
end