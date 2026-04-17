extends Node

var tooltipSettings = preload("res://ContainerTooltipExtras/TooltipSettings.tres")
var McmHelpers = load("res://ModConfigurationMenu/Scripts/Doink Oink/MCM_Helpers.tres")

var config = ConfigFile.new()

const FILE_PATH = "user://MCM/ContainerTooltipExtras"
const MOD_ID = "ContainerTooltipExtras"

func _ready() -> void:
	config.set_value("Bool", "tooltipPlusEnabled", {
		"name" = "Tooltip(+) - Enabled",
		"tooltip" = "",
		"default" = false,
		"value" = false
	})
	config.set_value("Bool", "tooltipPlusValuablesEnabled", {
		"name" = "Tooltip(+ (valuables)) - Enabled",
		"tooltip" = "",
		"default" = false,
		"value" = false
	})


	if McmHelpers != null:
		tooltipSettings.mcmHelpers = McmHelpers
		if !FileAccess.file_exists(FILE_PATH + "/config.ini"):
			DirAccess.open("user://").make_dir(FILE_PATH)
			config.save(FILE_PATH + "/config.ini")
		else:
			McmHelpers.CheckConfigurationHasUpdated(MOD_ID, config, FILE_PATH + "/config.ini")
			config.load(FILE_PATH + "/config.ini")

		_on_cte_config_updated(config)

		McmHelpers.RegisterConfiguration(
			MOD_ID,
			"Container Tooltip Extras",
			FILE_PATH,
			"Container Tooltip Extras",
			{
				"config.ini" = _on_cte_config_updated
			}
		)

func _on_cte_config_updated(_config: ConfigFile):
	print("Container Tooltip Extras config updated")

	var tooltip_plus_enabled = _config.get_value("Bool", "tooltipPlusEnabled")["value"]
	var tooltip_plus_valuables_enabled = _config.get_value("Bool", "tooltipPlusValuablesEnabled")["value"]

	if !tooltip_plus_enabled and tooltip_plus_valuables_enabled:
		tooltip_plus_valuables_enabled = false

		var valuables_setting = _config.get_value("Bool", "tooltipPlusValuablesEnabled")
		valuables_setting["value"] = false
		_config.set_value("Bool", "tooltipPlusValuablesEnabled", valuables_setting)
		_config.save(FILE_PATH + "/config.ini")

	tooltipSettings.tooltipPlusEnabled = tooltip_plus_enabled
	tooltipSettings.tooltipPlusValuablesEnabled = tooltip_plus_valuables_enabled
	
	tooltipSettings.mcmEnabled = true