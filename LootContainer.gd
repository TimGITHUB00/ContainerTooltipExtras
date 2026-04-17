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
				if slotData.itemData.type == "Weapon" and tooltipSettings.weapons or slotData.itemData.type == "Knife" and tooltipSettings.knives or slotData.itemData.type == "Grenade" and tooltipSettings.grenades or slotData.itemData.type == "Electronics" and tooltipSettings.electronics or slotData.itemData.type == "Rig" and tooltipSettings.rigs or slotData.itemData.type == "Helmet" and tooltipSettings.helmets or slotData.itemData.type == "Armor" and tooltipSettings.armors or slotData.itemData.type == "Attachment" and tooltipSettings.attachments or slotData.itemData.type == "Ammo" and tooltipSettings.ammo or slotData.itemData.type == "Medical" and tooltipSettings.medical:
					if tooltipSettings.tooltipPlusValuablesEnabled:
						has_valuables = true
						break

	gameData.tooltip = containerName + (" [Open+ (valuables)]" if has_items and has_valuables else " [Open+]" if has_items else " [Open]")