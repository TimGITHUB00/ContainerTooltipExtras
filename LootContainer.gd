extends "res://Scripts/LootContainer.gd"

var tooltipSettings = preload("res://ContainerTooltipExtras/TooltipSettings.tres")

func UpdateTooltip():
	if locked:
		gameData.tooltip = containerName + " [Locked]"
		return

	UpdateTooltipData()

func UpdateTooltipData():
	var source = storage if storaged else loot
	var has_items := false
	var has_valuables := false

	for slotData in source:
		if slotData != null and slotData.itemData != null:
			if tooltipSettings.tooltipPlusEnabled:
				has_items = true
				if slotData.itemData.type == "Weapon" or slotData.itemData.type == "Knife" or slotData.itemData.type == "Grenade" or slotData.itemData.type == "Electronics" or slotData.itemData.type == "Rig" or slotData.itemData.type == "Helmet" or slotData.itemData.type == "Armor" or slotData.itemData.type == "Attachment" or slotData.itemData.type == "Ammo" or slotData.itemData.type == "Medical":
					if tooltipSettings.tooltipPlusValuablesEnabled:
						has_valuables = true
						break

	gameData.tooltip = containerName + (" [Open+ (valuables)]" if has_items and has_valuables else " [Open+]" if has_items else " [Open]")