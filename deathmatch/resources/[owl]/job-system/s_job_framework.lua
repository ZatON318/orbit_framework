function cancelCityMaintenance()
	--exports.global:takeItem(source, 115, "41:1:Spraycan", 2500)
	outputConsole("test")
end
addEvent("cancelCityMaintenance", true)
addEventHandler("cancelCityMaintenance", getRootElement(), cancelCityMaintenance)