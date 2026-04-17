extends "res://Scripts/LootContainer.gd"

func UpdateTooltip():
	if locked:
		gameData.tooltip = containerName + " [Locked]"
		return

	UpdateTooltipData()

func UpdateTooltipData():
	var source = storage if storaged else loot
	var has_items := false

	for slotData in source:
		if slotData != null and slotData.itemData != null:
			has_items = true
			break

	gameData.tooltip = containerName + (" [Open+]" if has_items else " [Open]")