extends "res://Scripts/Interface.gd"

func Close():
	if itemDragged:
		Drop(itemDragged)

	if container:
		StorageContainerGrid()
		container.UpdateTooltipData()
		ClearContainerGrid()
		container.ContainerAudio()
		container = null

	if trader:
		if !gameData.tutorial:
			Loader.SaveTrader(trader.traderData.name)

		ResetTrading()
		ClearSupplyGrid()
		trader.PlayTraderEnd()
		trader = null

	Reset()
	ResetInput()
	HideAllUI()
	UpdateStats(false)
	tooltip.hide()
	highlight.hide()