extends Node

func _ready() -> void:
	overrideScript("res://ContainerTooltipExtras/LootContainer.gd")
	overrideScript("res://ContainerTooltipExtras/Interface.gd")
	overrideScript("res://ContainerTooltipExtras/HUD.gd")

func overrideScript(overrideScriptPath : String):
	var script : Script = load(overrideScriptPath)
	script.reload()
	var parentScript = script.get_base_script()
	script.take_over_path(parentScript.resource_path)