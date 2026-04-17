extends "res://Scripts/LootContainer.gd"

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
			has_items = true
			if slotData.itemData.type == "Weapon" or slotData.itemData.type == "Knife" or slotData.itemData.type == "Attachment" or slotData.itemData.type == "Ammo" or slotData.itemData.type == "Medical":
				has_valuables = true
				break

	gameData.tooltip = containerName + (" [Open+ (valuables)]" if has_items and has_valuables else " [Open+]" if has_items else " [Open]")