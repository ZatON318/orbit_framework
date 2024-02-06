local localPlayer = getLocalPlayer()

local vozidla = { 400, 
}

addEventHandler("onClientResourceStart", resourceRoot, function ()
	for k,v in ipairs(vozidla)do
		txd = engineLoadTXD("vehicles/"..v..".txd")
		engineImportTXD(txd, v)
		dff = engineLoadDFF("vehicles/"..v..".dff", v)
		engineReplaceModel(dff, v)
		engineSetAsynchronousLoading(true,false)
	end
end)

function vypnoutskiny(thePlayer, commandName, ...)
	for key, player in ipairs(getElementsByType("player")) do
	local reskiny = getElementData(player, "reskiny")
			for k,v in ipairs(vozidla) do
				engineRestoreModel ( v )
			end
	end	
end
addEvent ( "vypnoutskiny", true )
addEventHandler ( "vypnoutskiny", root, vypnoutskiny )

function zapnout(thePlayer, commandName, ...)
	for key, player in ipairs(getElementsByType("player")) do
	local reskiny = getElementData(player, "reskiny")
			for k,v in ipairs(vozidla) do
				txd = engineLoadTXD("vehicles/"..v..".txd")
				engineImportTXD(txd, v)
				dff = engineLoadDFF("vehicles/"..v..".dff", v)
				engineReplaceModel(dff, v)
			end
	end	
	
end
addEvent ( "zapnoutskiny", true )
addEventHandler ( "zapnoutskiny", root, zapnout )